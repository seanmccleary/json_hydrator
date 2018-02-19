// GENERATED CODE - DO NOT MODIFY BY HAND

part of json_hydrator.test;

// **************************************************************************
// Generator: JsonMapperGenerator
// Target: class TestOuterClass
// **************************************************************************

// ignore_for_file: cascade_invocations

/// Maps an object of type TestOuterClass to JSON
String testOuterClassToJson(TestOuterClass obj) {
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
  stringBuffer.write(testInnerClassToJson(obj.anInnerClass));
  stringBuffer.write('}');
  return stringBuffer.toString();
}

// **************************************************************************
// Generator: JsonMapperGenerator
// Target: class TestInnerClass
// **************************************************************************

// ignore_for_file: cascade_invocations

/// Maps an object of type TestInnerClass to JSON
String testInnerClassToJson(TestInnerClass obj) {
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
