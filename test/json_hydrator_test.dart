library json_hydrator.test;

import 'dart:convert';
import "package:test/test.dart";

part "json_hydrator_test.g.dart";

void main() {
  final String correctJson =
      '{"aString":"That\'s \\"this\\"","aNum":10,"anInt":20,"aDouble":1.23,"anIntList":[1,2,3],"aStringList":["one","two","three"],"numberList":[[10,20,30],[400,500,600]],"drinkList":[[["one","one","three"],["uno","dos","tres"],["eins","zwei","drei"]],[["beer","water","milk"],["cerveza","agua","leche"],["bier","wasser","milch"]]],"aStringIntMap":{"ten":10,"twenty":20,"thirty":30},"anIntStringMap":{"1":"one","2":"two","3":"three"},"anIntMapOfIntBoolMaps":{"100":{"101":false,"102":false},"200":{"201":false,"202":true},"300":{"301":true,"302":false},"400":{"401":true,"402":true}},"anIntMapOfStringStringMaps":{"1":{"en":"one","es":"uno"},"2":{"en":"two","es":"dos"},"3":{"en":"three","es":"tres"}},"aDateTime":"2017-03-03T22:41:01.002003Z","aNullString":null,"aNullInt":null,"aBoolTrue":true,"aBoolFalse":false,"anInnerClass":{"anInnerString":"That\'s \\"that\\"","anInnerNum":11,"anInnerInt":21,"anInnerDouble":3.45,"anInnerIntList":[10,20,30],"anInnerStringIntMap":{},"anInnerIntStringMap":{},"anInnerDateTime":"1979-12-20T00:02:03.004005Z"}}';
  final _TestInnerClass correctInnerClass = new _TestInnerClass()
    ..anInnerString = "That's \"that\""
    ..anInnerNum = 11
    ..anInnerInt = 21
    ..anInnerDouble = 3.45
    ..anInnerIntList = <int>[10, 20, 30]
    ..anInnerDateTime = new DateTime(1979, 12, 20, 01, 02, 03, 04, 05);

  final _TestOuterClass correctOuterClass =
      new _TestOuterClass("That's \"this\"", 10, 20, 1.23)
        ..anIntList = <int>[1, 2, 3]
        ..aStringList = <String>["one", "two", "three"]
        ..numberList = <List<int>>[
          <int>[10, 20, 30],
          <int>[400, 500, 600]
        ]
        ..drinkList = <List<List<String>>>[
          <List<String>>[
            <String>["one", "one", "three"],
            <String>["uno", "dos", "tres"],
            <String>["eins", "zwei", "drei"]
          ],
          <List<String>>[
            <String>["beer", "water", "milk"],
            <String>["cerveza", "agua", "leche"],
            <String>["bier", "wasser", "milch"]
          ]
        ]
        ..anIntStringMap = <int, String>{1: "one", 2: "two", 3: "three"}
        ..aStringIntMap = <String, int>{"ten": 10, "twenty": 20, "thirty": 30}
        ..anIntMapOfIntBoolMaps = <int, Map<int, bool>>{
          100: <int, bool>{101: false, 102: false},
          200: <int, bool>{201: false, 202: true},
          300: <int, bool>{301: true, 302: false},
          400: <int, bool>{401: true, 402: true}
        }
        ..anIntMapOfStringStringMaps = <int, Map<String, String>>{
          1: <String, String>{"en": "one", "es": "uno"},
          2: <String, String>{"en": "two", "es": "dos"},
          3: <String, String>{"en": "three", "es": "tres"}
        }
        ..aDateTime = new DateTime.utc(2017, 3, 3, 22, 41, 1, 2, 3)
        ..anInnerClass = correctInnerClass;

  group('To JSON', () {
    test('_testOuterClassToJson', () {
      final String generatedJson = _testOuterClassToJson(correctOuterClass);
      expect(generatedJson, equals(correctJson));
    });
  });

  group('To Object', () {
    final JsonDecoder jsonDecoder = const JsonDecoder();
    final dynamic data = jsonDecoder.convert(correctJson);
    final _TestOuterClass generatedOuterClass =
        _jsonToTestOuterClass(data as Map<String, dynamic>);
    test(
        "aString",
        () => expect(
            generatedOuterClass.aString, equals(correctOuterClass.aString)));
    test("aNum",
        () => expect(generatedOuterClass.aNum, equals(correctOuterClass.aNum)));
    test(
        "anInt",
        () =>
            expect(generatedOuterClass.anInt, equals(correctOuterClass.anInt)));
    test(
        "aDouble",
        () => expect(
            generatedOuterClass.aDouble, equals(correctOuterClass.aDouble)));
    test(
        "anIntList",
        () => expect(generatedOuterClass.anIntList,
            equals(correctOuterClass.anIntList)));
    test(
        "aStringList",
        () => expect(generatedOuterClass.aStringList,
            equals(correctOuterClass.aStringList)));
    test(
        "numberList",
        () => expect(generatedOuterClass.numberList,
            equals(correctOuterClass.numberList)));
    test(
        "drinkList",
        () => expect(generatedOuterClass.drinkList,
            equals(correctOuterClass.drinkList)));
    test(
        "anIntStringMap",
        () => expect(generatedOuterClass.anIntStringMap,
            equals(correctOuterClass.anIntStringMap)));
    test(
        "aStringIntMap",
        () => expect(generatedOuterClass.aStringIntMap,
            equals(correctOuterClass.aStringIntMap)));
    test(
        "anIntMapOfIntBoolMaps",
        () => expect(generatedOuterClass.anIntMapOfIntBoolMaps,
            equals(correctOuterClass.anIntMapOfIntBoolMaps)));
    test(
        "anIntMapOfStringStringMaps",
        () => expect(generatedOuterClass.anIntMapOfStringStringMaps,
            equals(correctOuterClass.anIntMapOfStringStringMaps)));
    test(
        "aDateTime",
        () => expect(generatedOuterClass.aDateTime,
            equals(correctOuterClass.aDateTime)));
    test(
        "aNullString",
        () => expect(generatedOuterClass.aNullString,
            equals(correctOuterClass.aNullString)));
    test(
        "aNullInt",
        () => expect(
            generatedOuterClass.aNullInt, equals(correctOuterClass.aNullInt)));
    test(
        "aBoolTrue",
        () => expect(generatedOuterClass.aBoolTrue,
            equals(correctOuterClass.aBoolTrue)));
    test(
        "aBoolFalse",
        () => expect(generatedOuterClass.aBoolFalse,
            equals(correctOuterClass.aBoolFalse)));
    // TODO. generatedOuterClass.anInnerClass
  });
}

class _TestOuterClass {
  String aString;
  num aNum;
  int anInt;
  double aDouble;
  List<int> anIntList = <int>[];
  List<String> aStringList = <String>[];
  List<List<int>> numberList = <List<int>>[];
  List<List<List<String>>> drinkList = <List<List<String>>>[];
  Map<String, int> aStringIntMap = <String, int>{};
  Map<int, String> anIntStringMap = <int, String>{};
  Map<int, Map<int, bool>> anIntMapOfIntBoolMaps = <int, Map<int, bool>>{};
  Map<int, Map<String, String>> anIntMapOfStringStringMaps =
      <int, Map<String, String>>{};
  DateTime aDateTime;
  String aNullString;
  int aNullInt;
  bool aBoolTrue = true;
  bool aBoolFalse = false;
  _TestInnerClass anInnerClass;

  _TestOuterClass(this.aString, this.aNum, this.anInt, this.aDouble);
  _TestOuterClass.smallConstructor(this.aString, this.aNum);
}

class _TestInnerClass {
  String anInnerString;
  num anInnerNum;
  int anInnerInt;
  double anInnerDouble;
  List<int> anInnerIntList = <int>[];
  Map<String, int> anInnerStringIntMap = <String, int>{};
  Map<int, String> anInnerIntStringMap = <int, String>{};
  DateTime anInnerDateTime;
}
