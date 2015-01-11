# dart json hydrator

This is a tool for turning objects into JSON and back again.

It is based on code from Chris Buckett's JsonObject package, which you can find at
https://github.com/chrisbu/dartwatch-JsonObject

I created it because I wanted a way to truly hydrate PODO objects from JSON without
relying on noSuchMethod.

It's probably not a speed demon.  It's a work in progress.  If anyone wants
to contribute, they'd be my pal.

## Examples

### Converting a PODO to JSON

```

// This is the class we'll be using
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

// Now instantiate a person
Person p = new Person("Sean", new Color(0xff));
p.age = 34;
p.parent = new Person("Tom", new Color(0, 0xC0));
p.dogs = ["Boris", "Max", "Bella"];
p.schools = {"Grade": "Jacksonville", "Middle": "Mac", "High": "SMHS"};

// Create a mapper for that type
var humanMapper = new JsonHydrator<Person>();

humanMapper.objectToJson(p)).then((json) => print(json));

```

### Converting JSON to a PDO
```
humanMapper.getObject(personJson).then((p) => doSomethingWithPerson(p));
```