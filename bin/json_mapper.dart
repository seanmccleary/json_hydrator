import "../lib/json_hydrator.dart";

void main() {



  Person p = new Person("Sean", new Color(0xff));
  //p.name = "Sean";
  p.age = 34;
  p.parent = new Person("Tom", new Color(0, 0xC0));
  //p.parent.name = "Tom";
  p.dogs = ["Boris", "Max", "Bella"];
  p.schools = {"Grade": "Jacksonville", "Middle": "Mac", "High": "SMHS"};
  //p.favoriteColor = new Color(0xff);
  //p.favoriteColor.r = 0xff;
  //p.parent.favoriteColor = new Color(0, 0xC0);

  var mapper = new JsonHydrator<Person>();

  var json1 = '';
  var json2 = '';

  mapper.objectToJson(p)
    .then((json) {
      json1 = json;
      print("JSON: " + json);
      return mapper.getObject(json);
    })
    .then((Person p) {
      print("Object: " + p.toString());
      return mapper.objectToJson(p);
    })
    .then((json) {
      json2 = json;
      print("JSON: " + json);
      print(json1 == json2 ? "THEY MATCH" : "THEY DO NOT MATCH");
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

