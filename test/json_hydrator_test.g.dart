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
  stringBuffer.write('"aMapOfMaps":');
  final List<int> aMapOfMapsKeys1 = obj.aMapOfMaps.keys.toList();
  stringBuffer.write('{');
  for (int aMapOfMapsCounter1 = 0;
      aMapOfMapsCounter1 < aMapOfMapsKeys1.length;
      aMapOfMapsCounter1++) {
    if (aMapOfMapsKeys1[aMapOfMapsCounter1] == null) {
      stringBuffer.write('null');
    } else {
      stringBuffer.write(
          '"${aMapOfMapsKeys1[aMapOfMapsCounter1].toString().replaceAll('"', '\\"')}"');
    }
    stringBuffer.write(':');
    final List<String> aMapOfMapsKeys2 =
        obj.aMapOfMaps[aMapOfMapsKeys1[aMapOfMapsCounter1]].keys.toList();
    stringBuffer.write('{');
    for (int aMapOfMapsCounter2 = 0;
        aMapOfMapsCounter2 < aMapOfMapsKeys2.length;
        aMapOfMapsCounter2++) {
      if (aMapOfMapsKeys2[aMapOfMapsCounter2] == null) {
        stringBuffer.write('null');
      } else {
        stringBuffer.write(
            '"${aMapOfMapsKeys2[aMapOfMapsCounter2].toString().replaceAll('"', '\\"')}"');
      }
      stringBuffer.write(':');
      if (obj.aMapOfMaps[aMapOfMapsKeys1[aMapOfMapsCounter1]]
              [aMapOfMapsKeys2[aMapOfMapsCounter2]] ==
          null) {
        stringBuffer.write('null');
      } else {
        stringBuffer.write(
            '"${obj.aMapOfMaps[aMapOfMapsKeys1[aMapOfMapsCounter1]][aMapOfMapsKeys2[aMapOfMapsCounter2]].toString().replaceAll('"', '\\"')}"');
      }
      if (aMapOfMapsCounter2 !=
          obj.aMapOfMaps[aMapOfMapsKeys1[aMapOfMapsCounter1]].length - 1) {
        stringBuffer.write(',');
      }
    }
    stringBuffer.write('}');
    if (aMapOfMapsCounter1 != obj.aMapOfMaps.length - 1) {
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
  if (data.containsKey('aString') && data['aString'] is String) {
    object.aString = data['aString'] as String;
  }
  if (data.containsKey('aNum') && data['aNum'] is num) {
    object.aNum = data['aNum'] as num;
  }
  if (data.containsKey('anInt') && data['anInt'] is int) {
    object.anInt = data['anInt'] as int;
  }
  if (data.containsKey('aDouble') && data['aDouble'] is double) {
    object.aDouble = data['aDouble'] as double;
  }
  if (data.containsKey('anIntList') && data['anIntList'] is List<int>) {
    object.anIntList = data['anIntList'] as List<int>;
  }
  if (data.containsKey('aStringList') && data['aStringList'] is List<String>) {
    object.aStringList = data['aStringList'] as List<String>;
  }
  if (data.containsKey('numberList') && data['numberList'] is List<List<int>>) {
    object.numberList = data['numberList'] as List<List<int>>;
  }
  if (data.containsKey('drinkList') &&
      data['drinkList'] is List<List<List<String>>>) {
    object.drinkList = data['drinkList'] as List<List<List<String>>>;
  }
  if (data.containsKey('aStringIntMap') &&
      data['aStringIntMap'] is Map<String, int>) {
    object.aStringIntMap = data['aStringIntMap'] as Map<String, int>;
  }
  if (data.containsKey('anIntStringMap') &&
      data['anIntStringMap'] is Map<String, String>) {
    object.anIntStringMap = new Map<int, String>.fromIterables(
        (data['anIntStringMap'] as Map<String, String>).keys.map(int.parse),
        (data['anIntStringMap'] as Map<String, String>).values);
  }
  if (data.containsKey('aMapOfMaps') &&
      data['aMapOfMaps'] is Map<String, Map<String, String>>) {
    object.aMapOfMaps = new Map<int, Map<String, String>>.fromIterables(
        (data['aMapOfMaps'] as Map<String, Map<String, String>>)
            .keys
            .map(int.parse),
        (data['aMapOfMaps'] as Map<String, Map<String, String>>).values);
  }
  if (data.containsKey('aDateTime') && data['aDateTime'] is String) {
    object.aDateTime = DateTime.parse(data['aDateTime'] as String);
  }
  if (data.containsKey('aNullString') && data['aNullString'] is String) {
    object.aNullString = data['aNullString'] as String;
  }
  if (data.containsKey('aNullInt') && data['aNullInt'] is int) {
    object.aNullInt = data['aNullInt'] as int;
  }
  if (data.containsKey('aBoolTrue') && data['aBoolTrue'] is bool) {
    object.aBoolTrue = data['aBoolTrue'] as bool;
  }
  if (data.containsKey('aBoolFalse') && data['aBoolFalse'] is bool) {
    object.aBoolFalse = data['aBoolFalse'] as bool;
  }
  if (data.containsKey('anInnerClass') &&
      data['anInnerClass'] is _TestInnerClass) {
    object.anInnerClass = data['anInnerClass'] as _TestInnerClass;
  }
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
  if (data.containsKey('anInnerString') && data['anInnerString'] is String) {
    object.anInnerString = data['anInnerString'] as String;
  }
  if (data.containsKey('anInnerNum') && data['anInnerNum'] is num) {
    object.anInnerNum = data['anInnerNum'] as num;
  }
  if (data.containsKey('anInnerInt') && data['anInnerInt'] is int) {
    object.anInnerInt = data['anInnerInt'] as int;
  }
  if (data.containsKey('anInnerDouble') && data['anInnerDouble'] is double) {
    object.anInnerDouble = data['anInnerDouble'] as double;
  }
  if (data.containsKey('anInnerIntList') &&
      data['anInnerIntList'] is List<int>) {
    object.anInnerIntList = data['anInnerIntList'] as List<int>;
  }
  if (data.containsKey('anInnerStringIntMap') &&
      data['anInnerStringIntMap'] is Map<String, int>) {
    object.anInnerStringIntMap =
        data['anInnerStringIntMap'] as Map<String, int>;
  }
  if (data.containsKey('anInnerIntStringMap') &&
      data['anInnerIntStringMap'] is Map<String, String>) {
    object.anInnerIntStringMap = new Map<int, String>.fromIterables(
        (data['anInnerIntStringMap'] as Map<String, String>)
            .keys
            .map(int.parse),
        (data['anInnerIntStringMap'] as Map<String, String>).values);
  }
  if (data.containsKey('anInnerDateTime') &&
      data['anInnerDateTime'] is String) {
    object.anInnerDateTime = DateTime.parse(data['anInnerDateTime'] as String);
  }
  return object;
}
