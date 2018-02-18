library json_hydrator.test;

import "package:test/test.dart";

part "json_hydrator_test.g.dart";

void main() {
  group('A group of tests', () {
    test('To JSON', () {
      final TestInnerClass testInnerClass = new TestInnerClass()
        ..anInnerString = "That's \"that\""
        ..anInnerNum = 11
        ..anInnerInt = 21
        ..anInnerDouble = 3.45
        ..anInnerIntList = <int>[10, 20, 30]
        ..anInnerDateTime = new DateTime(1979, 12, 20, 01, 02, 03, 04, 05);

      final TestOuterClass testOuterClass = new TestOuterClass()
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

      final String json = testOuterClassToJson(testOuterClass);
      expect(
          json,
          equals(
              '{"aString":"That\'s \\"this\\"","aNum":10,"anInt":20,"aDouble":1.23,"anIntList":[1,2,3],"aStringList":["one","two","three"],"numberList":[[10,20,30],[400,500,600]],"drinkList":[[["one","one","three"],["uno","dos","tres"],["eins","zwei","drei"]],[["beer","water","milk"],["cerveza","agua","leche"],["bier","wasser","milch"]]],"aStringIntMap":{"ten":10,"twenty":20,"thirty":30},"anIntStringMap":{"1":"one","2":"two","3":"three"},"aMapOfMaps":{"1":{"en":"one","es":"uno"},"2":{"en":"two","es":"dos"},"3":{"en":"three","es":"tres"}},"aDateTime":"2017-03-03T21:41:01.002003Z","aNullString":null,"aNullInt":null,"aBoolTrue":true,"aBoolFalse":false,"anInnerClass":{"anInnerString":"That\'s \\"that\\"","anInnerNum":11,"anInnerInt":21,"anInnerDouble":3.45,"anInnerIntList":[10,20,30],"anInnerStringIntMap":{},"anInnerIntStringMap":{},"anInnerDateTime":"1979-12-20T00:02:03.004005Z"}}'));
    });
  });
}

// ignore: public_member_api_docs
class TestOuterClass {
  // ignore: public_member_api_docs
  String aString;
  // ignore: public_member_api_docs
  num aNum;
  // ignore: public_member_api_docs
  int anInt;
  // ignore: public_member_api_docs
  double aDouble;
  // ignore: public_member_api_docs
  List<int> anIntList = <int>[];
  // ignore: public_member_api_docs
  List<String> aStringList = <String>[];
  // ignore: public_member_api_docs
  List<List<int>> numberList = <List<int>>[];
  // ignore: public_member_api_docs
  List<List<List<String>>> drinkList = <List<List<String>>>[];
  // ignore: public_member_api_docs
  Map<String, int> aStringIntMap = <String, int>{};
  // ignore: public_member_api_docs
  Map<int, String> anIntStringMap = <int, String>{};
  // ignore: public_member_api_docs
  Map<int, Map<String, String>> aMapOfMaps = <int, Map<String, String>>{};
  // ignore: public_member_api_docs
  DateTime aDateTime;
  // ignore: public_member_api_docs
  String aNullString;
  // ignore: public_member_api_docs
  int aNullInt;
  // ignore: public_member_api_docs
  bool aBoolTrue = true;
  // ignore: public_member_api_docs
  bool aBoolFalse = false;
  // ignore: public_member_api_docs
  TestInnerClass anInnerClass;
}

// ignore: public_member_api_docs
class TestInnerClass {
  // ignore: public_member_api_docs
  String anInnerString;
  // ignore: public_member_api_docs
  num anInnerNum;
  // ignore: public_member_api_docs
  int anInnerInt;
  // ignore: public_member_api_docs
  double anInnerDouble;
  // ignore: public_member_api_docs
  List<int> anInnerIntList = <int>[];
  // ignore: public_member_api_docs
  Map<String, int> anInnerStringIntMap = <String, int>{};
  // ignore: public_member_api_docs
  Map<int, String> anInnerIntStringMap = <int, String>{};
  // ignore: public_member_api_docs
  DateTime anInnerDateTime;
}
