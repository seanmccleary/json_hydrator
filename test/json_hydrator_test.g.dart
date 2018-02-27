// GENERATED CODE - DO NOT MODIFY BY HAND

part of json_hydrator.test;

// **************************************************************************
// Generator: JsonMapperGenerator
// Target: class _TestOuterClass
// **************************************************************************

// ignore_for_file: cascade_invocations

/// Maps an object of type _TestOuterClass to JSON
String _testOuterClassToJson(_TestOuterClass obj) {
  final StringBuffer stringBuffer = new StringBuffer();
  stringBuffer.write('{');
  stringBuffer.write('"aString":');
  if (obj.aString == null) {
    stringBuffer.write('null');
  } else {
    stringBuffer.write('"${obj.aString.toString().replaceAll('"', '\\"')}"');
  }
  stringBuffer.write(',');
  stringBuffer.write('"aNum":');
  stringBuffer.write('${obj.aNum}');
  stringBuffer.write(',');
  stringBuffer.write('"anInt":');
  stringBuffer.write('${obj.anInt}');
  stringBuffer.write(',');
  stringBuffer.write('"aDouble":');
  stringBuffer.write('${obj.aDouble}');
  stringBuffer.write(',');
  stringBuffer.write('"anIntList":');
  stringBuffer.write('[');
  for (int anIntListCounter1 = 0;
      anIntListCounter1 < obj.anIntList.length;
      anIntListCounter1++) {
    stringBuffer.write('${obj.anIntList[anIntListCounter1]}');
    if (anIntListCounter1 != obj.anIntList.length - 1) {
      stringBuffer.write(',');
    }
  }
  stringBuffer.write(']');
  stringBuffer.write(',');
  stringBuffer.write('"aStringList":');
  stringBuffer.write('[');
  for (int aStringListCounter1 = 0;
      aStringListCounter1 < obj.aStringList.length;
      aStringListCounter1++) {
    if (obj.aStringList[aStringListCounter1] == null) {
      stringBuffer.write('null');
    } else {
      stringBuffer.write(
          '"${obj.aStringList[aStringListCounter1].toString().replaceAll('"', '\\"')}"');
    }
    if (aStringListCounter1 != obj.aStringList.length - 1) {
      stringBuffer.write(',');
    }
  }
  stringBuffer.write(']');
  stringBuffer.write(',');
  stringBuffer.write('"numberList":');
  stringBuffer.write('[');
  for (int numberListCounter1 = 0;
      numberListCounter1 < obj.numberList.length;
      numberListCounter1++) {
    stringBuffer.write('[');
    for (int numberListCounter2 = 0;
        numberListCounter2 < obj.numberList[numberListCounter1].length;
        numberListCounter2++) {
      stringBuffer
          .write('${obj.numberList[numberListCounter1][numberListCounter2]}');
      if (numberListCounter2 != obj.numberList[numberListCounter1].length - 1) {
        stringBuffer.write(',');
      }
    }
    stringBuffer.write(']');
    if (numberListCounter1 != obj.numberList.length - 1) {
      stringBuffer.write(',');
    }
  }
  stringBuffer.write(']');
  stringBuffer.write(',');
  stringBuffer.write('"drinkList":');
  stringBuffer.write('[');
  for (int drinkListCounter1 = 0;
      drinkListCounter1 < obj.drinkList.length;
      drinkListCounter1++) {
    stringBuffer.write('[');
    for (int drinkListCounter2 = 0;
        drinkListCounter2 < obj.drinkList[drinkListCounter1].length;
        drinkListCounter2++) {
      stringBuffer.write('[');
      for (int drinkListCounter3 = 0;
          drinkListCounter3 <
              obj.drinkList[drinkListCounter1][drinkListCounter2].length;
          drinkListCounter3++) {
        if (obj.drinkList[drinkListCounter1][drinkListCounter2]
                [drinkListCounter3] ==
            null) {
          stringBuffer.write('null');
        } else {
          stringBuffer.write(
              '"${obj.drinkList[drinkListCounter1][drinkListCounter2][drinkListCounter3].toString().replaceAll('"', '\\"')}"');
        }
        if (drinkListCounter3 !=
            obj.drinkList[drinkListCounter1][drinkListCounter2].length - 1) {
          stringBuffer.write(',');
        }
      }
      stringBuffer.write(']');
      if (drinkListCounter2 != obj.drinkList[drinkListCounter1].length - 1) {
        stringBuffer.write(',');
      }
    }
    stringBuffer.write(']');
    if (drinkListCounter1 != obj.drinkList.length - 1) {
      stringBuffer.write(',');
    }
  }
  stringBuffer.write(']');
  stringBuffer.write(',');
  stringBuffer.write('"aStringIntMap":');
  final List<String> aStringIntMapKeys1 = obj.aStringIntMap.keys.toList();
  stringBuffer.write('{');
  for (int aStringIntMapCounter1 = 0;
      aStringIntMapCounter1 < aStringIntMapKeys1.length;
      aStringIntMapCounter1++) {
    if (aStringIntMapKeys1[aStringIntMapCounter1] == null) {
      stringBuffer.write('null');
    } else {
      stringBuffer.write(
          '"${aStringIntMapKeys1[aStringIntMapCounter1].toString().replaceAll('"', '\\"')}"');
    }
    stringBuffer.write(':');
    stringBuffer.write(
        '${obj.aStringIntMap[aStringIntMapKeys1[aStringIntMapCounter1]]}');
    if (aStringIntMapCounter1 != obj.aStringIntMap.length - 1) {
      stringBuffer.write(',');
    }
  }
  stringBuffer.write('}');
  stringBuffer.write(',');
  stringBuffer.write('"anIntStringMap":');
  final List<int> anIntStringMapKeys1 = obj.anIntStringMap.keys.toList();
  stringBuffer.write('{');
  for (int anIntStringMapCounter1 = 0;
      anIntStringMapCounter1 < anIntStringMapKeys1.length;
      anIntStringMapCounter1++) {
    if (anIntStringMapKeys1[anIntStringMapCounter1] == null) {
      stringBuffer.write('null');
    } else {
      stringBuffer.write(
          '"${anIntStringMapKeys1[anIntStringMapCounter1].toString().replaceAll('"', '\\"')}"');
    }
    stringBuffer.write(':');
    if (obj.anIntStringMap[anIntStringMapKeys1[anIntStringMapCounter1]] ==
        null) {
      stringBuffer.write('null');
    } else {
      stringBuffer.write(
          '"${obj.anIntStringMap[anIntStringMapKeys1[anIntStringMapCounter1]].toString().replaceAll('"', '\\"')}"');
    }
    if (anIntStringMapCounter1 != obj.anIntStringMap.length - 1) {
      stringBuffer.write(',');
    }
  }
  stringBuffer.write('}');
  stringBuffer.write(',');
  stringBuffer.write('"anIntMapOfIntBoolMaps":');
  final List<int> anIntMapOfIntBoolMapsKeys1 =
      obj.anIntMapOfIntBoolMaps.keys.toList();
  stringBuffer.write('{');
  for (int anIntMapOfIntBoolMapsCounter1 = 0;
      anIntMapOfIntBoolMapsCounter1 < anIntMapOfIntBoolMapsKeys1.length;
      anIntMapOfIntBoolMapsCounter1++) {
    if (anIntMapOfIntBoolMapsKeys1[anIntMapOfIntBoolMapsCounter1] == null) {
      stringBuffer.write('null');
    } else {
      stringBuffer.write(
          '"${anIntMapOfIntBoolMapsKeys1[anIntMapOfIntBoolMapsCounter1].toString().replaceAll('"', '\\"')}"');
    }
    stringBuffer.write(':');
    final List<int> anIntMapOfIntBoolMapsKeys2 = obj
        .anIntMapOfIntBoolMaps[
            anIntMapOfIntBoolMapsKeys1[anIntMapOfIntBoolMapsCounter1]]
        .keys
        .toList();
    stringBuffer.write('{');
    for (int anIntMapOfIntBoolMapsCounter2 = 0;
        anIntMapOfIntBoolMapsCounter2 < anIntMapOfIntBoolMapsKeys2.length;
        anIntMapOfIntBoolMapsCounter2++) {
      if (anIntMapOfIntBoolMapsKeys2[anIntMapOfIntBoolMapsCounter2] == null) {
        stringBuffer.write('null');
      } else {
        stringBuffer.write(
            '"${anIntMapOfIntBoolMapsKeys2[anIntMapOfIntBoolMapsCounter2].toString().replaceAll('"', '\\"')}"');
      }
      stringBuffer.write(':');
      stringBuffer.write(
          '${obj.anIntMapOfIntBoolMaps[anIntMapOfIntBoolMapsKeys1[anIntMapOfIntBoolMapsCounter1]][anIntMapOfIntBoolMapsKeys2[anIntMapOfIntBoolMapsCounter2]]}');
      if (anIntMapOfIntBoolMapsCounter2 !=
          obj
                  .anIntMapOfIntBoolMaps[
                      anIntMapOfIntBoolMapsKeys1[anIntMapOfIntBoolMapsCounter1]]
                  .length -
              1) {
        stringBuffer.write(',');
      }
    }
    stringBuffer.write('}');
    if (anIntMapOfIntBoolMapsCounter1 != obj.anIntMapOfIntBoolMaps.length - 1) {
      stringBuffer.write(',');
    }
  }
  stringBuffer.write('}');
  stringBuffer.write(',');
  stringBuffer.write('"anIntMapOfStringStringMaps":');
  final List<int> anIntMapOfStringStringMapsKeys1 =
      obj.anIntMapOfStringStringMaps.keys.toList();
  stringBuffer.write('{');
  for (int anIntMapOfStringStringMapsCounter1 = 0;
      anIntMapOfStringStringMapsCounter1 <
          anIntMapOfStringStringMapsKeys1.length;
      anIntMapOfStringStringMapsCounter1++) {
    if (anIntMapOfStringStringMapsKeys1[anIntMapOfStringStringMapsCounter1] ==
        null) {
      stringBuffer.write('null');
    } else {
      stringBuffer.write(
          '"${anIntMapOfStringStringMapsKeys1[anIntMapOfStringStringMapsCounter1].toString().replaceAll('"', '\\"')}"');
    }
    stringBuffer.write(':');
    final List<String> anIntMapOfStringStringMapsKeys2 = obj
        .anIntMapOfStringStringMaps[
            anIntMapOfStringStringMapsKeys1[anIntMapOfStringStringMapsCounter1]]
        .keys
        .toList();
    stringBuffer.write('{');
    for (int anIntMapOfStringStringMapsCounter2 = 0;
        anIntMapOfStringStringMapsCounter2 <
            anIntMapOfStringStringMapsKeys2.length;
        anIntMapOfStringStringMapsCounter2++) {
      if (anIntMapOfStringStringMapsKeys2[anIntMapOfStringStringMapsCounter2] ==
          null) {
        stringBuffer.write('null');
      } else {
        stringBuffer.write(
            '"${anIntMapOfStringStringMapsKeys2[anIntMapOfStringStringMapsCounter2].toString().replaceAll('"', '\\"')}"');
      }
      stringBuffer.write(':');
      if (obj.anIntMapOfStringStringMaps[anIntMapOfStringStringMapsKeys1[
                  anIntMapOfStringStringMapsCounter1]][
              anIntMapOfStringStringMapsKeys2[
                  anIntMapOfStringStringMapsCounter2]] ==
          null) {
        stringBuffer.write('null');
      } else {
        stringBuffer.write(
            '"${obj.anIntMapOfStringStringMaps[anIntMapOfStringStringMapsKeys1[anIntMapOfStringStringMapsCounter1]][anIntMapOfStringStringMapsKeys2[anIntMapOfStringStringMapsCounter2]].toString().replaceAll('"', '\\"')}"');
      }
      if (anIntMapOfStringStringMapsCounter2 !=
          obj
                  .anIntMapOfStringStringMaps[anIntMapOfStringStringMapsKeys1[
                      anIntMapOfStringStringMapsCounter1]]
                  .length -
              1) {
        stringBuffer.write(',');
      }
    }
    stringBuffer.write('}');
    if (anIntMapOfStringStringMapsCounter1 !=
        obj.anIntMapOfStringStringMaps.length - 1) {
      stringBuffer.write(',');
    }
  }
  stringBuffer.write('}');
  stringBuffer.write(',');
  stringBuffer.write('"aDateTime":');
  stringBuffer.write('"${obj.aDateTime.toUtc().toIso8601String()}"');
  stringBuffer.write(',');
  stringBuffer.write('"aNullString":');
  if (obj.aNullString == null) {
    stringBuffer.write('null');
  } else {
    stringBuffer
        .write('"${obj.aNullString.toString().replaceAll('"', '\\"')}"');
  }
  stringBuffer.write(',');
  stringBuffer.write('"aNullInt":');
  stringBuffer.write('${obj.aNullInt}');
  stringBuffer.write(',');
  stringBuffer.write('"aBoolTrue":');
  stringBuffer.write('${obj.aBoolTrue}');
  stringBuffer.write(',');
  stringBuffer.write('"aBoolFalse":');
  stringBuffer.write('${obj.aBoolFalse}');
  stringBuffer.write(',');
  stringBuffer.write('"anInnerClass":');
  stringBuffer.write(_testInnerClassToJson(obj.anInnerClass));
  stringBuffer.write('}');
  return stringBuffer.toString();
}

_TestOuterClass _jsonToTestOuterClass(Map<String, dynamic> data) {
  _TestOuterClass object;
  // First find values to use for a constructor
  // Try the most specific constructor first
  if (data.containsKey('aString') &&
      data['aString'] is String &&
      data.containsKey('aNum') &&
      data['aNum'] is num &&
      data.containsKey('anInt') &&
      data['anInt'] is int &&
      data.containsKey('aDouble') &&
      data['aDouble'] is double) {
    object = new _TestOuterClass(data['aString'] as String, data['aNum'] as num,
        data['anInt'] as int, data['aDouble'] as double);
  } else if (data.containsKey('aString') &&
      data['aString'] is String &&
      data.containsKey('aNum') &&
      data['aNum'] is num) {
    object = new _TestOuterClass.smallConstructor(
        data['aString'] as String, data['aNum'] as num);
  } else {
    throw new Exception('Could not find appropriate constructor.');
  }
  object.aString = data['aString'] as String;
  object.aNum = data['aNum'] as num;
  object.anInt = data['anInt'] as int;
  object.aDouble = data['aDouble'] as double;
  object.anIntList = data['anIntList'] as List<int>;
  object.aStringList = data['aStringList'] as List<String>;
  object.numberList = data['numberList'] as List<List<int>>;
  object.drinkList = data['drinkList'] as List<List<List<String>>>;
  object.aStringIntMap = <String, int>{};
  final Iterable<String> aStringIntMapKeys =
      data['aStringIntMap'].keys as Iterable<String>;
  for (String aStringIntMapKey in aStringIntMapKeys) {
    object.aStringIntMap[aStringIntMapKey] = (data['aStringIntMap']
        as Map<String, dynamic>)[aStringIntMapKey] as int;
  }
  object.anIntStringMap = <int, String>{};
  final Iterable<String> anIntStringMapKeys =
      data['anIntStringMap'].keys as Iterable<String>;
  for (String anIntStringMapKey in anIntStringMapKeys) {
    object.anIntStringMap[int.parse(anIntStringMapKey)] =
        (data['anIntStringMap'] as Map<String, dynamic>)[anIntStringMapKey]
        as String;
  }
  object.anIntMapOfIntBoolMaps = <int, Map<int, bool>>{};
  final Iterable<String> anIntMapOfIntBoolMapsKeys =
      data['anIntMapOfIntBoolMaps'].keys as Iterable<String>;
  for (String anIntMapOfIntBoolMapsKey in anIntMapOfIntBoolMapsKeys) {
    object.anIntMapOfIntBoolMaps[int.parse(anIntMapOfIntBoolMapsKey)] =
        <int, bool>{};
    final Iterable<String> anIntMapOfIntBoolMapsKeyKeys =
        (data['anIntMapOfIntBoolMaps'] as Map<String, dynamic>)[
                anIntMapOfIntBoolMapsKey]
            .keys as Iterable<String>;
    for (String anIntMapOfIntBoolMapsKeyKey in anIntMapOfIntBoolMapsKeyKeys) {
      object.anIntMapOfIntBoolMaps[int.parse(anIntMapOfIntBoolMapsKey)]
              [int.parse(anIntMapOfIntBoolMapsKeyKey)] =
          ((data['anIntMapOfIntBoolMaps'] as Map<String, dynamic>)[
                  anIntMapOfIntBoolMapsKey]
              as Map<String, dynamic>)[anIntMapOfIntBoolMapsKeyKey] as bool;
    }
  }
  object.anIntMapOfStringStringMaps = <int, Map<String, String>>{};
  final Iterable<String> anIntMapOfStringStringMapsKeys =
      data['anIntMapOfStringStringMaps'].keys as Iterable<String>;
  for (String anIntMapOfStringStringMapsKey in anIntMapOfStringStringMapsKeys) {
    object.anIntMapOfStringStringMaps[
        int.parse(anIntMapOfStringStringMapsKey)] = <String, String>{};
    final Iterable<String> anIntMapOfStringStringMapsKeyKeys =
        (data['anIntMapOfStringStringMaps'] as Map<String, dynamic>)[
                anIntMapOfStringStringMapsKey]
            .keys as Iterable<String>;
    for (String anIntMapOfStringStringMapsKeyKey
        in anIntMapOfStringStringMapsKeyKeys) {
      object.anIntMapOfStringStringMaps[
              int.parse(anIntMapOfStringStringMapsKey)]
          [anIntMapOfStringStringMapsKeyKey] = ((data[
                  'anIntMapOfStringStringMaps']
              as Map<String, dynamic>)[anIntMapOfStringStringMapsKey]
          as Map<String, dynamic>)[anIntMapOfStringStringMapsKeyKey] as String;
    }
  }
  object.aDateTime = DateTime.parse(data['aDateTime'] as String);
  object.aNullString = data['aNullString'] as String;
  object.aNullInt = data['aNullInt'] as int;
  object.aBoolTrue = data['aBoolTrue'] as bool;
  object.aBoolFalse = data['aBoolFalse'] as bool;
  //object.anInnerClass = data['anInnerClass'] as _TestInnerClass;
  return object;
}

// **************************************************************************
// Generator: JsonMapperGenerator
// Target: class _TestInnerClass
// **************************************************************************

// ignore_for_file: cascade_invocations

/// Maps an object of type _TestInnerClass to JSON
String _testInnerClassToJson(_TestInnerClass obj) {
  final StringBuffer stringBuffer = new StringBuffer();
  stringBuffer.write('{');
  stringBuffer.write('"anInnerString":');
  if (obj.anInnerString == null) {
    stringBuffer.write('null');
  } else {
    stringBuffer
        .write('"${obj.anInnerString.toString().replaceAll('"', '\\"')}"');
  }
  stringBuffer.write(',');
  stringBuffer.write('"anInnerNum":');
  stringBuffer.write('${obj.anInnerNum}');
  stringBuffer.write(',');
  stringBuffer.write('"anInnerInt":');
  stringBuffer.write('${obj.anInnerInt}');
  stringBuffer.write(',');
  stringBuffer.write('"anInnerDouble":');
  stringBuffer.write('${obj.anInnerDouble}');
  stringBuffer.write(',');
  stringBuffer.write('"anInnerIntList":');
  stringBuffer.write('[');
  for (int anInnerIntListCounter1 = 0;
      anInnerIntListCounter1 < obj.anInnerIntList.length;
      anInnerIntListCounter1++) {
    stringBuffer.write('${obj.anInnerIntList[anInnerIntListCounter1]}');
    if (anInnerIntListCounter1 != obj.anInnerIntList.length - 1) {
      stringBuffer.write(',');
    }
  }
  stringBuffer.write(']');
  stringBuffer.write(',');
  stringBuffer.write('"anInnerStringIntMap":');
  final List<String> anInnerStringIntMapKeys1 =
      obj.anInnerStringIntMap.keys.toList();
  stringBuffer.write('{');
  for (int anInnerStringIntMapCounter1 = 0;
      anInnerStringIntMapCounter1 < anInnerStringIntMapKeys1.length;
      anInnerStringIntMapCounter1++) {
    if (anInnerStringIntMapKeys1[anInnerStringIntMapCounter1] == null) {
      stringBuffer.write('null');
    } else {
      stringBuffer.write(
          '"${anInnerStringIntMapKeys1[anInnerStringIntMapCounter1].toString().replaceAll('"', '\\"')}"');
    }
    stringBuffer.write(':');
    stringBuffer.write(
        '${obj.anInnerStringIntMap[anInnerStringIntMapKeys1[anInnerStringIntMapCounter1]]}');
    if (anInnerStringIntMapCounter1 != obj.anInnerStringIntMap.length - 1) {
      stringBuffer.write(',');
    }
  }
  stringBuffer.write('}');
  stringBuffer.write(',');
  stringBuffer.write('"anInnerIntStringMap":');
  final List<int> anInnerIntStringMapKeys1 =
      obj.anInnerIntStringMap.keys.toList();
  stringBuffer.write('{');
  for (int anInnerIntStringMapCounter1 = 0;
      anInnerIntStringMapCounter1 < anInnerIntStringMapKeys1.length;
      anInnerIntStringMapCounter1++) {
    if (anInnerIntStringMapKeys1[anInnerIntStringMapCounter1] == null) {
      stringBuffer.write('null');
    } else {
      stringBuffer.write(
          '"${anInnerIntStringMapKeys1[anInnerIntStringMapCounter1].toString().replaceAll('"', '\\"')}"');
    }
    stringBuffer.write(':');
    if (obj.anInnerIntStringMap[
            anInnerIntStringMapKeys1[anInnerIntStringMapCounter1]] ==
        null) {
      stringBuffer.write('null');
    } else {
      stringBuffer.write(
          '"${obj.anInnerIntStringMap[anInnerIntStringMapKeys1[anInnerIntStringMapCounter1]].toString().replaceAll('"', '\\"')}"');
    }
    if (anInnerIntStringMapCounter1 != obj.anInnerIntStringMap.length - 1) {
      stringBuffer.write(',');
    }
  }
  stringBuffer.write('}');
  stringBuffer.write(',');
  stringBuffer.write('"anInnerDateTime":');
  stringBuffer.write('"${obj.anInnerDateTime.toUtc().toIso8601String()}"');
  stringBuffer.write('}');
  return stringBuffer.toString();
}

_TestInnerClass _jsonToTestInnerClass(Map<String, dynamic> data) {
  _TestInnerClass object;
  // First find values to use for a constructor
  // Try the most specific constructor first
  object = new _TestInnerClass();
  object.anInnerString = data['anInnerString'] as String;
  object.anInnerNum = data['anInnerNum'] as num;
  object.anInnerInt = data['anInnerInt'] as int;
  object.anInnerDouble = data['anInnerDouble'] as double;
  object.anInnerIntList = data['anInnerIntList'] as List<int>;
  object.anInnerStringIntMap = <String, int>{};
  final Iterable<String> anInnerStringIntMapKeys =
      data['anInnerStringIntMap'].keys as Iterable<String>;
  for (String anInnerStringIntMapKey in anInnerStringIntMapKeys) {
    object.anInnerStringIntMap[anInnerStringIntMapKey] =
        (data['anInnerStringIntMap'] as Map<String, dynamic>)[
            anInnerStringIntMapKey] as int;
  }
  object.anInnerIntStringMap = <int, String>{};
  final Iterable<String> anInnerIntStringMapKeys =
      data['anInnerIntStringMap'].keys as Iterable<String>;
  for (String anInnerIntStringMapKey in anInnerIntStringMapKeys) {
    object.anInnerIntStringMap[int.parse(anInnerIntStringMapKey)] =
        (data['anInnerIntStringMap'] as Map<String, dynamic>)[
            anInnerIntStringMapKey] as String;
  }
  object.anInnerDateTime = DateTime.parse(data['anInnerDateTime'] as String);
  return object;
}
