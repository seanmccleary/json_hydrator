import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

/// A generator to create classes which map objects to JSON.
class JsonMapperGenerator extends Generator {

  final RegExp _trimObjName = new RegExp(r'^[^\.]+\.');
  final RegExp _trimAfterBracket = new RegExp(r'\[.+$');
  final RegExp _listTypeRegExp = new RegExp(r"^List<(.+)>$");
  final RegExp _mapTypeRegExp = new RegExp(r"^Map<(.+)>$");

  @override
  Future<String> generate(Element element, _) async {
    if (element is! ClassElement) {
      return null;
    }

    final String className = element.displayName;
    final String toJsonFunctionName =
        "${className[0].toLowerCase()}${className.substring(1)}ToJson";

    // Generate the toJson method
    final String generatedCode = """
      /// Maps an object of type $className to JSON
      String $toJsonFunctionName($className obj) {
        final StringBuffer stringBuffer = new StringBuffer();
        ${_generateToJsonFunction(element)}
        return stringBuffer.toString();
      }""";

    return generatedCode;
  }

  /// Create the function to convert an object to JSON
  String _generateToJsonFunction(ClassElement classElement) {
    final StringBuffer generatedCode =
        new StringBuffer('stringBuffer.write("{");');

    final List<PropertyAccessorElement> properties = classElement.accessors
        .where((PropertyAccessorElement property) =>
            property.isGetter && property.isPublic)
        .toList();

    for (int count = 0; count < properties.length; count++) {
      final PropertyAccessorElement property = properties[count];

      generatedCode
        ..write("""
          // ignore: cascade_invocations
          stringBuffer.write('\"${property.displayName}\":');
        """)
        ..write(_getCodeSnippetForElementValue(
            property.returnType.displayName, "obj.${property.displayName}"));

      if (count != properties.length - 1) {
        generatedCode.write("""
          // ignore: cascade_invocations
          stringBuffer.write(",");
        """);
      }
    }

    generatedCode.write("""
      // ignore: cascade_invocations
      stringBuffer.write("}");
    """);
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
      generatedCode.write("""
        // ignore: cascade_invocations
        stringBuffer.write("\${$propertyName}");
      """);
    }

    // Is it a List?
    else if (_isTypeNameList(returnTypeName)) {
      final String listType = _getListType(returnTypeName);

      final String propertyNameCounter =
          "${propertyName.replaceAll(_trimObjName, "").replaceAll(_trimAfterBracket, "")}Counter$nestingLevel";

      generatedCode.write("""
        // ignore: cascade_invocations
        stringBuffer.write('[');
        for (int $propertyNameCounter = 0; $propertyNameCounter < $propertyName.length; $propertyNameCounter++) {
          ${_getCodeSnippetForElementValue(listType, "$propertyName[$propertyNameCounter]", nestingLevel: nestingLevel + 1)}
          if ($propertyNameCounter != $propertyName.length - 1) {
            stringBuffer.write(",");
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

      generatedCode.write("""
        final List<${keyValuePairTypes.keyType}> $keysArrayName = $propertyName.keys.toList();
        stringBuffer.write('{');
        for (int $keysArrayCounter = 0; $keysArrayCounter < $keysArrayName.length; $keysArrayCounter++) {
          ${_getCodeSnippetForElementValue(keyValuePairTypes.keyType, "$keysArrayName[$keysArrayCounter]", nestingLevel: nestingLevel + 1, treatAsString: true)}
          // ignore: cascade_invocations
          stringBuffer.write(':');
          ${_getCodeSnippetForElementValue(keyValuePairTypes.valueType, "$propertyName[$keysArrayName[$keysArrayCounter]]", nestingLevel: nestingLevel + 1)}
          if ($keysArrayCounter != $propertyName.length - 1) {
            // ignore: cascade_invocations
            stringBuffer.write(",");
          }
        }
        stringBuffer.write('}');""");
    }

    // Is it a DateTime?  If so make it an ISO8601 string.
    else if (_isTypeNameDateTime(returnTypeName)) {
      generatedCode.write("""
        // ignore: cascade_invocations
        stringBuffer.write('\"\${$propertyName.toUtc().toIso8601String()}\"');
      """);
    }

    // Is it an object?
    else {
      final String innerClassName = returnTypeName;
      final String innerToJsonFunctionName =
          "${innerClassName[0].toLowerCase()}${innerClassName.substring(1)}ToJson";
      generatedCode.write("""
        // ignore: cascade_invocations
        stringBuffer.write($innerToJsonFunctionName($propertyName));
      """);
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
  String _getListType(String typeName) =>_listTypeRegExp.firstMatch(typeName).group(1);

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
