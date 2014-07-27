part of json_hydrator;

/**
 * Functionality to map classes of a given type to JSON and back.
 */
class JsonHydrator<T> {

  /**
   * Get an object of type T from the [json] string.
   */
  Future<T> getObject(String json) {

    Completer completer = new Completer();
    T object = this._map2Object(JSON.decode(json), T);
    completer.complete(object);
    return completer.future;

  }

  /**
   * Convert a [decoded] Map to an object of a given [type].  This is broken
   * into a separate method so it can recurse if [decoded] has nested Maps.
   */
  Object _map2Object(Map decoded, Type type) {

    // We're going to have to reflect the class to see what it looks like.
    ClassMirror classMirror = reflectClass(type);

    // OK, before we can instantiate an object, we need to know if it takes any
    // constructor parameters.
    MethodMirror constructor = classMirror.declarations.values.firstWhere(
            (dm) => dm is MethodMirror && dm.isConstructor);

    List constructorPositionalArguments = new List();

    // OK, we have to figure out what the parameters to this-a-here constructor
    // are and try and put them into a Map so we can instantiate 'er
    constructor.parameters.forEach((ParameterMirror pm) {

      String parameterName = MirrorSystem.getName(pm.simpleName);

      // Does the mapified version of our object contain an attribute with the
      // same name as one of our constructor arguments?
      if (decoded.containsKey(parameterName)) {

        String parameterType = MirrorSystem.getName(pm.type.simpleName);

        if (_isTypeNamePrimitive(parameterType, decoded[parameterName] is Map,
        decoded[parameterName] is List)
        ) {

          constructorPositionalArguments.add(decoded[parameterName]);

        } else if (decoded[parameterName] is Map) {

          constructorPositionalArguments.add(_map2Object(decoded[parameterName],
          pm.type.reflectedType));

        } else if(decoded[parameterName] != null) {

          throw new Exception("I don't know how to turn '${parameterName}' "
          "into an instance of ${parameterType}"
          );

        }

        // Won't be needing this anymore, I reckon.
        decoded.remove(parameterName);
      }
    });

    // Now we should be able to instantiate it.
    InstanceMirror instanceMirror = classMirror.newInstance(
        constructor.constructorName,
        constructorPositionalArguments
    );

    // Now let's populate all the class members we can.
    classMirror.instanceMembers.forEach((Symbol symbol, MethodMirror mm) {

      if (mm.isSetter && !mm.isPrivate && !mm.isStatic) {

        String setterName = MirrorSystem.getName(symbol);
        // Setters have an annoying "=" on the end
        setterName = setterName.substring(0, setterName.length - 1);

        if (decoded.containsKey(setterName)) {

          String setterType =
          MirrorSystem.getName(mm.parameters.first.type.simpleName);

          var setValue = null;

          if (_isTypeNamePrimitive(setterType, decoded[setterName] is Map,
          decoded[setterName] is List)
          ) {

            setValue = decoded[setterName];

          } else if (decoded[setterName] is Map) {

            setValue = this._map2Object(decoded[setterName],
            mm.parameters.first.type.reflectedType);

          } else if (decoded[setterName] != null) {

            throw new Exception("I don't know how to turn ${setterName} into "
            "an instance of ${setterType}.");
          }

          instanceMirror.setField(new Symbol(setterName), setValue);
        }
      }
    });

    return instanceMirror.reflectee;
  }

  /**
   * Determine if the name of a type is that of a primitive type.  Optionally
   * allow "Map" or "List".
   */
  bool _isTypeNamePrimitive(String typeName, bool isMapOk, bool isListOk) {
    return typeName == 'num'
    || typeName == 'int'
    || typeName == 'double'
    || typeName == 'bool'
    || typeName == 'String'
    || typeName == 'dynamic'
    || (typeName == 'Map' && isMapOk)
    || (typeName == 'List' && isListOk);
  }

  /**
   * Convert an [object] to a JSON string
   */
  Future<String> objectToJson(Object object) {

    var completer = new Completer<String>();

    var onSuccess = (value) {
      _logger.fine("About to stringify: $value");
      var string = JSON.encode(value);
      _logger.fine("...stringified to $string");
      completer.complete(string);
    };

    var onError = (error) {
      _logger.fine("JsonObject Future Error: $object");
      _logger.fine("Object: ${object.runtimeType}");
      _logger.fine("Stringified: ${JSON.encode(object)}");
      completer.completeError(error, error.stackTrace);
    };

    objectToSerializable(object).then(onSuccess, onError:onError);

    return completer.future;

  }

  Future objectToSerializable(Object object, [key=null]) {
    var completer = new Completer();

    if (_isPrimitive(object)) {
      _serializeNative(object, completer, key);
    } else if (object is Map) {
      _serializeMap(object, completer, key);
    } else if (object is List) {
      _serializeList(object, completer, key);
    } else {
      var instanceMirror = reflect(object);
      _serializeObject(instanceMirror, completer, key);
      // all other processing of regular classes
    }

    return completer.future;
  }

  bool _isPrimitive(Object object) {
    if (object is num || object is bool || object is String || object == null) {
      return true;
    } else {
      return false;
    }
  }

  void _serializeNative(Object object, Completer completer, key) {
    _logger.fine("native: $object");
    // "native" object types - just complete with that type
    _complete(completer, object, key);
  }

  void _serializeMap(Map object, Completer completer, key) {
    _logger.fine("map: $object");

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
    _logger.fine("list: $object");

    // each item in the list will be an object to serialize.
    List<Future> listItemsToComplete = new List<Future>();
    object.forEach((item) {
      listItemsToComplete.add(objectToSerializable(item));
    });

    var onAllItemsComplete = (items) => _complete(completer, items, key);
    var onItemsError = (error) => completer.completeError(error);

    Future.wait(listItemsToComplete).then(onAllItemsComplete, onError:onItemsError);
  }

  void _serializeObject(InstanceMirror instanceMirror, Completer completer, key) {
    _logger.fine("object: $instanceMirror");
    var classMirror = instanceMirror.type;

    var resultMap = new Map();
    var futuresList = new List<Future>();

    classMirror.declarations.forEach((getterKey, getter) {


      if (getter is VariableMirror && !getter.isPrivate && !getter.isStatic) {
        _logger.fine("getter: ${getter.qualifiedName}");

        var instanceMirrorField = instanceMirror.getField(getterKey);
        Object reflectee = instanceMirrorField.reflectee;
        _logger.fine("Got reflectee for $getterKey: ${reflectee}");
        if (_isPrimitive(reflectee)) {
          resultMap[MirrorSystem.getName(getterKey)] = reflectee;
        } else {
          Future<String> recursed = objectToSerializable(reflectee).catchError((error) {
            _logger.fine("Error: $error");
            completer.completeError(error);
          });
          recursed.then((json) => resultMap[MirrorSystem.getName(getterKey)] = json);
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
}
