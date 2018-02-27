import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

/// A generator to create classes which map objects to JSON.
class JsonMapperGenerator extends Generator {
  final RegExp _trimObjName = new RegExp(r'^[^\.]+\.');
  final RegExp _trimAfterBracket = new RegExp(r'\[.+$');
  final RegExp _listTypeRegExp = new RegExp(r"^List<(.+)>$");
  final RegExp _mapTypeRegExp = new RegExp(r"^Map<(.+)>$");
  final RegExp _singleLetter = new RegExp("[A-Za-z]");

  @override
  Future<String> generate(Element element, _) async {
    if (element is! ClassElement) {
      return null;
    }

    final String className = element.displayName;
    final String toJsonFunctionName = _getMapToJsonFunctionName(className);
    final String toObjectFunctionName = _getMapToObjectFunctionName(className);

    // Generate the toJson method
    final String generatedCode = """
      // ignore_for_file: cascade_invocations

      /// Maps an object of type $className to JSON
      String $toJsonFunctionName($className obj) {
        ${_generateToJsonFunction(element as ClassElement)}
      }

      $className $toObjectFunctionName(Map<String, dynamic> data) {
        $className object;
        ${_generateToObjectFunction(element as ClassElement)}
      }
      """;

    return generatedCode;
  }

  /// Create the function to convert an object to JSON
  String _generateToJsonFunction(ClassElement classElement) {
    // TODO: Pass this StringBuffer in to the recursive function rather than having it return a string.
    final StringBuffer generatedCode = new StringBuffer("""
            final StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.write('{');""");

    final List<PropertyAccessorElement> properties = classElement.accessors
        .where((PropertyAccessorElement property) =>
            property.isGetter && property.isPublic)
        .toList();

    for (int count = 0; count < properties.length; count++) {
      final PropertyAccessorElement property = properties[count];

      generatedCode
        ..write("stringBuffer.write('\"${property.displayName}\":');")
        ..write(_getCodeSnippetForElementValue(
            property.returnType.displayName, "obj.${property.displayName}"));

      if (count != properties.length - 1) {
        generatedCode.write("stringBuffer.write(',');");
      }
    }

    generatedCode.write("""
      stringBuffer.write('}');
      return stringBuffer.toString();""");
    return generatedCode.toString();
  }

  /// Gets the snippet of generated code for displaying a value of an element
  String _getCodeSnippetForElementValue(
      String returnTypeName, String propertyName,
      {int nestingLevel: 1, bool treatAsString: false}) {
    final StringBuffer generatedCode = new StringBuffer();

    // Is it a String? If so, put it in quotation marks
    if (treatAsString || _isTypeNameString(returnTypeName)) {
      generatedCode.write("""
        if ($propertyName == null) {
          stringBuffer.write('null');
        } else {
          stringBuffer.write('"\${$propertyName.toString().replaceAll('"', '\\\\"')}"');
        }""");
    }

    // Is it a number or a bool?  If so just print it.
    else if (_isTypeNameNum(returnTypeName) ||
        _isTypeNameBool(returnTypeName)) {
      generatedCode.write("stringBuffer.write('\${$propertyName}');");
    }

    // Is it a List?
    else if (_isTypeNameList(returnTypeName)) {
      final String listType = _getListType(returnTypeName);

      final String propertyNameCounter =
          "${propertyName.replaceAll(_trimObjName, "").replaceAll(_trimAfterBracket, "")}Counter$nestingLevel";

      generatedCode.write("""
        stringBuffer.write('[');
        for (int $propertyNameCounter = 0; $propertyNameCounter < $propertyName.length; $propertyNameCounter++) {
          ${_getCodeSnippetForElementValue(listType, "$propertyName[$propertyNameCounter]", nestingLevel: nestingLevel + 1)}
          if ($propertyNameCounter != $propertyName.length - 1) {
            stringBuffer.write(',');
          }
        }
        stringBuffer.write(']');""");
    }

    // Is it a Map?
    else if (_isTypeNameMap(returnTypeName)) {
      final String keysArrayName =
          "${propertyName.replaceAll(_trimObjName, "").replaceAll(_trimAfterBracket, "")}Keys$nestingLevel";
      final String keysArrayCounter =
          "${propertyName.replaceAll(_trimObjName, "").replaceAll(_trimAfterBracket, "")}Counter$nestingLevel";
      final KeyValuePairTypes keyValuePairTypes = _getMapTypes(returnTypeName);
      // TODO: Can I avoid hinstanatiating a list below if I use an iterator?
      generatedCode.write("""
        final List<${keyValuePairTypes.keyType}> $keysArrayName = $propertyName.keys.toList();
        stringBuffer.write('{');
        for (int $keysArrayCounter = 0; $keysArrayCounter < $keysArrayName.length; $keysArrayCounter++) {
          ${_getCodeSnippetForElementValue(keyValuePairTypes.keyType, "$keysArrayName[$keysArrayCounter]", nestingLevel: nestingLevel + 1, treatAsString: true)}
          stringBuffer.write(':');
          ${_getCodeSnippetForElementValue(keyValuePairTypes.valueType, "$propertyName[$keysArrayName[$keysArrayCounter]]", nestingLevel: nestingLevel + 1)}
          if ($keysArrayCounter != $propertyName.length - 1) {
            stringBuffer.write(',');
          }
        }
        stringBuffer.write('}');""");
    }

    // Is it a DateTime?  If so make it an ISO8601 string.
    else if (_isTypeNameDateTime(returnTypeName)) {
      generatedCode.write(
          "stringBuffer.write('\"\${$propertyName.toUtc().toIso8601String()}\"');");
    }

    // Is it an object?
    else {
      final String innerClassName = returnTypeName;
      final String innerToJsonFunctionName =
          _getMapToJsonFunctionName(innerClassName);
      generatedCode.write(
          "stringBuffer.write($innerToJsonFunctionName($propertyName));");
    }

    return generatedCode.toString();
  }

  String _generateToObjectFunction(ClassElement classElement) {
    final StringBuffer generatedCode = new StringBuffer();
    generatedCode.writeln("""
      // First find values to use for a constructor
      // Try the most specific constructor first""");

    final List<ConstructorElement> constructors = classElement.constructors;
    constructors.sort((ConstructorElement ce1, ConstructorElement ce2) {
      if (ce1.parameters.length == ce2.parameters.length) {
        return 0;
      }
      return ce1.parameters.length < ce2.parameters.length ? 1 : -1;
    });

    bool firstIf = true;
    for (ConstructorElement ce in constructors) {
      if (ce.parameters.isNotEmpty) {
        final List<String> conditions = <String>[];
        final List<String> parameters = <String>[];
        for (ParameterElement pe in ce.parameters) {
          conditions.add(
              "data.containsKey('${pe.name}') && data['${pe.name}'] is ${pe.type.name}");
          parameters.add("data['${pe.name}'] as ${pe.type.name}");
        }

        generatedCode.writeln("""
          ${firstIf ? "if" : "else if"} (${conditions.join(" && ")}) {
            object = new ${classElement.name}${ce.name.isNotEmpty ? ".${ce.name}" : ""}(${parameters.join(", ")});
          }""");
        firstIf = false;
      } else {
        generatedCode.writeln(
            "object = new ${classElement.name}${ce.name.isNotEmpty ? ".${ce.name}" : ""}();");
      }
    }

    if (!firstIf) {
      generatedCode.write("""
        else {
          throw new Exception('Could not find appropriate constructor.');
        }
      """);
    }

    // Get a list of all the settings...
    final List<PropertyAccessorElement> properties = classElement.accessors
        .where((PropertyAccessorElement property) =>
            property.isSetter && property.isPublic)
        .toList();

    // And loop over them, trying to set them.
    for (PropertyAccessorElement property in properties) {
      generatedCode.write(_generateToObjectCodeForProperty(
          property.type.parameters.first.type.displayName,
          property.displayName,
          "data",
          "object.${property.displayName}"));
    }

    generatedCode.writeln("return object;");

    return generatedCode.toString();
  }

  String _generateToObjectCodeForProperty(String typeName, String propertyName,
      String sourceMapName, String targetObjectName,
      {bool isPropertyNameVariable: false}) {
    final String dataSourceKey =
        isPropertyNameVariable ? propertyName : "'$propertyName'";
    final StringBuffer generatedCode = new StringBuffer();

    if (_isTypeNameDateTime(typeName)) {
      generatedCode.write(
          "$targetObjectName = DateTime.parse($sourceMapName[$dataSourceKey] as String);");
    } else if (_isTypeNameMap(typeName)) {
      final KeyValuePairTypes keyValuePairTypes = _getMapTypes(typeName);
      final bool isKeyNumeric = _isTypeNameNum(keyValuePairTypes.keyType);
      final String sourceKeysType =
          isKeyNumeric ? "String" : keyValuePairTypes.keyType;
      final String keyName = "${propertyName}Key";
      final String nextTargetObjectName = isKeyNumeric
          ? "$targetObjectName[${keyValuePairTypes.keyType}.parse($keyName)]"
          : "$targetObjectName[$keyName]";

      generatedCode.write("""
        $targetObjectName = <${keyValuePairTypes.keyType}, ${keyValuePairTypes.valueType}>{};
        final Iterable<String> ${keyName}s = $sourceMapName[$dataSourceKey].keys as Iterable<String>;
        for (String $keyName in ${keyName}s) {
          ${_generateToObjectCodeForProperty(keyValuePairTypes.valueType, keyName, "($sourceMapName[$dataSourceKey] as Map<$sourceKeysType, dynamic>)", "$nextTargetObjectName", isPropertyNameVariable: true)}
        }
      """);
    } else {
      generatedCode.write(
          "$targetObjectName = $sourceMapName[$dataSourceKey] as $typeName;");
    }
    return generatedCode.toString();
  }

  /// Determines whether or not a DartType name represents a number.
  ///
  /// (No need to worry about checking for subclasses, because dart doesn't
  /// allow you to extend num, int or double.)
  bool _isTypeNameNum(String typeName) =>
      typeName == "num" || typeName == "int" || typeName == "double";

  /// Determines whether or not a DartType name represents a bool.
  ///
  /// (No need to worry about checking for subclasses, because Dart doesn't
  /// allow you to extend bool.)
  bool _isTypeNameBool(String typeName) => typeName == "bool";

  /// Determines whether or not a DartType name represents a String
  ///
  /// (No need to worry about checking for subclasses, because Dart doesn't
  /// allow you to extend String.)
  bool _isTypeNameString(String typeName) => typeName == "String";

  /// Determines whether or not a DartType name represents a List.
  ///
  /// TODO: Support subclasses of [List].
  /// There seem to be several ways to do this, according to this:
  /// http://stackoverflow.com/questions/16247045/how-do-i-extend-a-list-in-dart
  bool _isTypeNameList(String typeName) => _listTypeRegExp.hasMatch(typeName);

  /// Gets the type of a List
  ///
  /// i.e. List<int> returns "int"
  String _getListType(String typeName) =>
      _listTypeRegExp.firstMatch(typeName).group(1);

  /// Gets thet types of a Map
  ///
  /// i.e. Map<int, String> returns new KeyValuePairTypes("int", "String");
  KeyValuePairTypes _getMapTypes(String fullTypeName) {
    final String typeName = _mapTypeRegExp.firstMatch(fullTypeName).group(1);

    final StringBuffer keyTypeStringBuffer = new StringBuffer();
    final StringBuffer valueTypeStringBuffer = new StringBuffer();
    StringBuffer currentStringBuffer = keyTypeStringBuffer;

    int bracketCount = 0;
    for (int count = 0; count < typeName.length; count++) {
      final String currentCharacter = typeName[count];
      if (currentCharacter == "<") {
        bracketCount++;
      } else if (currentCharacter == ">") {
        bracketCount--;
      }

      if (currentCharacter == "," && bracketCount == 0) {
        currentStringBuffer = valueTypeStringBuffer;
      } else if (currentCharacter != " " || bracketCount > 0) {
        currentStringBuffer.write(currentCharacter);
      }
    }

    return new KeyValuePairTypes(
        keyTypeStringBuffer.toString(), valueTypeStringBuffer.toString());
  }

  /// Determines whether or not a DartType name represents a Map.
  ///
  /// TODO: Support sublcasses of [Map].
  bool _isTypeNameMap(String typeName) => _mapTypeRegExp.hasMatch(typeName);

  /// Determines whether or not a DartType name respresents a DateTime
  ///
  /// TODO: Support subclasses of [DateTime]
  bool _isTypeNameDateTime(String typeName) => typeName == "DateTime";

  String _getMapToJsonFunctionName(String className) =>
      "${className.replaceFirstMapped(_singleLetter, (Match m) => m.group(0).toLowerCase())}ToJson";

  String _getMapToObjectFunctionName(String className) {
    if (className.startsWith("_")) {
      return "_jsonTo${className.substring(1)}";
    }
    return "jsonTo$className";
  }
}

/// A pair of types use for the keys and values of a Map
class KeyValuePairTypes {
  /// Instantiates a KeyValuePairType
  KeyValuePairTypes(this.keyType, this.valueType);

  /// The type name of the key
  String keyType;

  /// The type name of the value
  String valueType;
}
