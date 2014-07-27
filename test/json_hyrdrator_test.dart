import 'package:unittest/unittest.dart';
import "../lib/json_hydrator.dart";

void main() {

  Person p = new Person("Sean", new Color(0xff));
  p.age = 34;
  p.parent = new Person("Tom", new Color(0, 0xC0));
  p.dogs = ["Boris", "Max", "Bella"];
  p.schools = {"Grade": "Jacksonville", "Middle": "Mac", "High": "SMHS"};

  String json = '{"name":"Sean","age":34,"something":null,"favoriteColor":{"r":255,"g":0,"b":0},"dogs":["Boris","Max","Bella"],"schools":{"Grade":"Jacksonville","Middle":"Mac","High":"SMHS"},"parent":{"name":"Tom","age":null,"parent":null,"dogs":null,"schools":null,"something":null,"favoriteColor":{"r":0,"g":192,"b":0}}}';

  var mapper = new JsonHydrator<Person>();

  // Convert the object to JSON
  test("objectToJson", () {
    var future = mapper.objectToJson(p);
    expect(future, completion(equals(json)));
  });

  // Conver tthe JSON to an object, then back to JSON for testing
  test("getObject", () {
    var future = mapper.getObject(json)
      .then((p) => mapper.objectToJson(p));
    expect(future, completion(equals(json)));
  });

}

class Person extends Object {
  String name;
  int age;
  Person parent;
  List<String> dogs;
  Map<String> schools;
  var something;
  Color favoriteColor;

  Person(this.name, this.favoriteColor);
}

class Color {
  int r;
  int g;
  int b;

  Color(this.r, [this.g = 0, this.b = 0]);
}
