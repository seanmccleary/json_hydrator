import 'package:unittest/unittest.dart';
import "../lib/json_hydrator.dart";

void main() {

  Person p = new Person("Sean", new Color(0xff));
  p.age = 34;
  p.parent = new Person("Tom", new Color(0, 0xC0));
  p.dogs = ["Boris", "Max", "Bella"];
  p.schools = {"Grade": "Jacksonville", "Middle": "Mac", "High": "SMHS"};

  String personJson = '{"name":"Sean","age":34,"something":null,"favoriteColor":{"r":255,"g":0,"b":0},"dogs":["Boris","Max","Bella"],"schools":{"Grade":"Jacksonville","Middle":"Mac","High":"SMHS"},"parent":{"name":"Tom","age":null,"parent":null,"dogs":null,"schools":null,"something":null,"favoriteColor":{"r":0,"g":192,"b":0}}}';

  Humanzee h = new Humanzee("Earl", new Color(0xff), new Color(0x0f));
  h.age = 15;
  h.parent = p;
  h.id = "123ABC";

  String humanzeeJson = '{"id":"123ABC","name":"Earl","age":15,"dogs":null,"schools":null,"something":null,"furColor":{"r":15,"g":0,"b":0},"favoriteColor":{"r":255,"g":0,"b":0},"parent":{"name":"Sean","age":34,"something":null,"favoriteColor":{"r":255,"g":0,"b":0},"dogs":["Boris","Max","Bella"],"schools":{"Grade":"Jacksonville","Middle":"Mac","High":"SMHS"},"parent":{"name":"Tom","age":null,"parent":null,"dogs":null,"schools":null,"something":null,"favoriteColor":{"r":0,"g":192,"b":0}}}}';

  var humanMapper = new JsonHydrator<Person>();
  var humanzeeMapper = new JsonHydrator<Humanzee>();

  // Convert the object to JSON
  test("objectToJson", () {
    var future = humanMapper.objectToJson(p);
    expect(future, completion(equals(personJson)));
  });

  // Make sure it works with subclasses
  test("subclassToJson", () {
    var future = humanzeeMapper.objectToJson(h);
    expect(future, completion(equals(humanzeeJson)));
  });

  // Convert the JSON to an object, then back to JSON for testing
  test("getObject", () {
    var future = humanMapper.getObject(personJson)
      .then((p) => humanMapper.objectToJson(p));
    expect(future, completion(equals(personJson)));
  });

  test("getSubclassObject", () {
    var future = humanzeeMapper.getObject(humanzeeJson)
      .then((h) => humanMapper.objectToJson(h));
    expect(future, completion(equals(humanzeeJson)));
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

class Humanzee extends Person with Entity {
  Color furColor;

  Humanzee(name, favoriteColor, this.furColor) : super(name, favoriteColor);
}
abstract class Entity {
  String id;
}

class Color {
  int r;
  int g;
  int b;

  Color(this.r, [this.g = 0, this.b = 0]);
}
