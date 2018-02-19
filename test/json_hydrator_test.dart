library json_hydrator.test;

import "package:test/test.dart";

part "json_hydrator_test.g.dart";

void main() {
  group('A group of tests', () {
    test('To JSON', () {
      final _TestInnerClass testInnerClass = new _TestInnerClass()
        ..anInnerString = "That's \"that\""
        ..anInnerNum = 11
        ..anInnerInt = 21
        ..anInnerDouble = 3.45
        ..anInnerIntList = <int>[10, 20, 30]
        ..anInnerDateTime = new DateTime(1979, 12, 20, 01, 02, 03, 04, 05);

      final _TestOuterClass testOuterClass = new _TestOuterClass()
        ..aNum = 10
        ..anInt = 20
        ..aDouble = 1.23
        ..aString = "That's \"this\""
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
        ..aMapOfMaps = <int, Map<String, String>>{
          1: <String, String>{"en": "one", "es": "uno"},
          2: <String, String>{"en": "two", "es": "dos"},
          3: <String, String>{"en": "three", "es": "tres"}
        }
        ..aDateTime = new DateTime(2017, 3, 3, 22, 41, 1, 2, 3)
        ..anInnerClass = testInnerClass;

      final String json = _testOuterClassToJson(testOuterClass);
      expect(
          json,
          equals(
              '{"aString":"That\'s \\"this\\"","aNum":10,"anInt":20,"aDouble":1.23,"anIntList":[1,2,3],"aStringList":["one","two","three"],"numberList":[[10,20,30],[400,500,600]],"drinkList":[[["one","one","three"],["uno","dos","tres"],["eins","zwei","drei"]],[["beer","water","milk"],["cerveza","agua","leche"],["bier","wasser","milch"]]],"aStringIntMap":{"ten":10,"twenty":20,"thirty":30},"anIntStringMap":{"1":"one","2":"two","3":"three"},"aMapOfMaps":{"1":{"en":"one","es":"uno"},"2":{"en":"two","es":"dos"},"3":{"en":"three","es":"tres"}},"aDateTime":"2017-03-03T21:41:01.002003Z","aNullString":null,"aNullInt":null,"aBoolTrue":true,"aBoolFalse":false,"anInnerClass":{"anInnerString":"That\'s \\"that\\"","anInnerNum":11,"anInnerInt":21,"anInnerDouble":3.45,"anInnerIntList":[10,20,30],"anInnerStringIntMap":{},"anInnerIntStringMap":{},"anInnerDateTime":"1979-12-20T00:02:03.004005Z"}}'));
    });
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
  Map<int, Map<String, String>> aMapOfMaps = <int, Map<String, String>>{};
  DateTime aDateTime;
  String aNullString;
  int aNullInt;
  bool aBoolTrue = true;
  bool aBoolFalse = false;
  _TestInnerClass anInnerClass;
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
