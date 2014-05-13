import 'dart:mirrors' as mirrors;
import "dart:convert";
import "dart:async";


void main() {
  Person p = new Person();
  p.name = "Sean";
  p.age = 34;
  p.parent = new Person();
  p.parent.name = "Tom";
  p.dogs = ["Boris", "Max", "Bella"];
  p.schools = {"Grade": "Jacksonville", "Middle": "Mac", "High": "SMHS"};
  p.favoriteColor = new Color();
  p.favoriteColor.r = 0xff;
  p.parent.favoriteColor = new Color(0, 0xC0);

  var mapper = new JsonMapper<Person>();

  var json1 = '';
  var json2 = '';

  mapper.objectToJson(p).then((json) {
    json1 = json;
    Person p1 = mapper.getObject(json);

    mapper.objectToJson(p1).then((json) {
      json2 = json;

      print(json1);
      print(json2);
      print(json1 == json2 ? "They match!" : "They do not match.");

    });
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
}

class Color {
  int r;
  int g;
  int b;

  Color([this.r = 0, this.g = 0, this.b = 0]);
}

class JsonMapper<T> {

  T getObject(String json) {
    return this._map2Object(JSON.decode(json), T);
  }

  Object _map2Object(Map decoded, Type type) {

    mirrors.ClassMirror classMirror = mirrors.reflectClass(type);
    mirrors.InstanceMirror instanceMirror = classMirror.newInstance(new Symbol(''), []);

    classMirror.instanceMembers.forEach((mirrors.Symbol symbol, mirrors.MethodMirror mm) {

      if (mm.isSetter && !mm.isPrivate && !mm.isStatic) {

        String setterName = mirrors.MirrorSystem.getName(symbol);
        // Setters have an annoying "=" on the end
        setterName = setterName.substring(0, setterName.length - 1);

        if (decoded.containsKey(setterName)) {

          String setterType = mirrors.MirrorSystem.getName(mm.parameters.first.type.simpleName);

          var setValue = null;

          if (
            setterType == 'num'
            || setterType == 'int'
            || setterType == 'double'
            || setterType == 'bool'
            || setterType == 'String'
            || setterType == 'dynamic'
            || (setterType == 'Map' && decoded[setterName] is Map)
            || (setterType == 'List' && decoded[setterName] is List)
          ) {
            setValue = decoded[setterName];
          } else if (decoded[setterName] is Map) {
            setValue = this._map2Object(decoded[setterName], mm.parameters.first.type.reflectedType);
          }
          instanceMirror.setField(new Symbol(setterName), setValue);
        }
      }
    });

    return instanceMirror.reflectee;
  }

  Future<String> objectToJson(Object object) {
    var completer = new Completer<String>();

    var onSuccess = (value) {
      _log("About to stringify: $value");
      var string = JSON.encode(value);
      _log("...stringified to $string");
      completer.complete(string);
    };

    var onError = (error) {
      _log("JsonObject Future Error: $object");
      _log("Object: ${object.runtimeType}");
      _log("Stringified: ${JSON.encode(object)}");
      completer.completeError(error, error.stackTrace);
    };

    objectToSerializable(object).then(onSuccess, onError:onError);

    return completer.future;

  }

  Future objectToSerializable(Object object, [key=null]) {
    var completer = new Completer();

    if (isPrimitive(object)) {
      _serializeNative(object, completer, key);
    } else if (object is Map) {
      _serializeMap(object, completer, key);
    } else if (object is List) {
      _serializeList(object, completer, key);
    } else {
      var instanceMirror = mirrors.reflect(object);
      _serializeObject(instanceMirror, completer, key);
      // all other processing of regular classes
    }

    return completer.future;
  }

  bool isPrimitive(Object object) {
    if (object is num || object is bool || object is String || object == null) {
      return true;
    } else {
      return false;
    }
  }

  void _serializeNative(Object object, Completer completer, key) {
    _log("native: $object");
    // "native" object types - just complete with that type
    _complete(completer, object, key);
  }

  void _serializeMap(Map object, Completer completer, key) {
    _log("map: $object");

    // convert the map into a serialized map
    // each value in the map may itself be a complex object or a "native" type.
    // so we need to test for this
    Map<String, Future> mapItemsToComplete = new Map<String, Future>();
    object.forEach((key, value) {
      mapItemsToComplete[key] = objectToSerializable(value, key);
    });

    var onAllItemsComplete = (List keyValuePairs) {
      // at this point (via the Future.wait callback)
      // all items in the map are complete.
      // but how to match the items back to the keys?
      var mapResult = new Map();
      keyValuePairs.forEach((kv) => mapResult[kv.key] = kv.value);
      _complete(completer, mapResult, key);
    };

    var onItemsError = (error) => completer.completeError(error);

    Future.wait(mapItemsToComplete.values).then(onAllItemsComplete, onError:onItemsError);
  }

  void _serializeList(List object, Completer completer, key) {
    _log("list: $object");

    // each item in the list will be an object to serialize.
    List<Future> listItemsToComplete = new List<Future>();
    object.forEach((item) {
      listItemsToComplete.add(objectToSerializable(item));
    });

    var onAllItemsComplete = (items) => _complete(completer, items, key);
    var onItemsError = (error) => completer.completeError(error);

    Future.wait(listItemsToComplete).then(onAllItemsComplete, onError:onItemsError);
  }

  void _serializeObject(mirrors.InstanceMirror instanceMirror, Completer completer, key) {
    _log("object: $instanceMirror");
    var classMirror = instanceMirror.type;

    var resultMap = new Map();
    var futuresList = new List<Future>();

    classMirror.declarations.forEach((getterKey, getter) {


      if (getter is mirrors.VariableMirror && !getter.isPrivate && !getter.isStatic) {
        _log("getter: ${getter.qualifiedName}");

        var instanceMirrorField = instanceMirror.getField(getterKey);
        Object reflectee = instanceMirrorField.reflectee;
        _log("Got reflectee for $getterKey: ${reflectee}");
        if (isPrimitive(reflectee)) {
          resultMap[mirrors.MirrorSystem.getName(getterKey)] = reflectee;
        } else {
          Future<String> recursed = objectToSerializable(reflectee).catchError((error) {
            _log("Error: $error");
            completer.completeError(error);
          });
          recursed.then((json) => resultMap[mirrors.MirrorSystem.getName(getterKey)] = json);
          futuresList.add(recursed);
        }

      }
    });

    Future.wait(futuresList).then((vals) {
      _complete(completer, resultMap, key);
    });
  }

  void _complete(Completer completer, object, key) {
    if (key != null) {
      completer.complete(new _KeyValuePair(key, object));
      // complete, because we can't reflect any deeper
    } else {
      completer.complete(object);
      // complete, because we can't reflect any deeper
    }
  }

  void _log(String message) {
    //print(message);
  }
}

class _KeyValuePair {
  var key;
  var value;

  _KeyValuePair(this.key, this.value);
}
