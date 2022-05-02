import 'package:pokedex/core/utilities/decodable/decodable_protocol.dart';

import '../decodable/decodable.dart';

extension StringUnwrapping on Map {
  String stringOf(String key) {
    return this[key];
  }
}

extension Doublenwrapping on Map {
  double doubleOf(String key) {
    return this[key];
  }
}

extension IntUnwrapping on Map {
  int intOf(String key) {
    return this[key];
  }
}

extension BoolUnwrapping on Map {
  bool boolOf(String key) {
    return this[key];
  }
}

extension ListOnMapUnwrapping on Map {
  List<T> _listOf<T>({
    required String key,
    required DecodableProtocol decodable,
  }) {
    final List<dynamic> _list = this[key];

    final List<Map<String, dynamic>> _listOf = _list
        .map((dynamic object) => Map<String, dynamic>.from(object))
        .toList();
    return decodable.fromJsonList<T>(_listOf);
  }
}

extension ListModelUnwrapping on Map {
  List<T> listOf<T>(String key) {
    return ListOnMapUnwrapping(this)._listOf(
      key: key,
      decodable: Decodable.decode,
    );
  }
}

extension ObjectUnwrapping on Map {
  T _objectOf<T>({
    required String key,
    required DecodableProtocol decodable,
  }) {
    final Map<String, dynamic> objectOf = Map<String, dynamic>.from(this[key]);
    return decodable.fromJson<T>(objectOf);
  }
}

extension UnnamedObjectUnwrapping on Map {
  T _objectOfThis<T>({
    DecodableProtocol? decodable,
  }) {
    final Map<String, dynamic> objectOf = Map<String, dynamic>.from(this);
    return decodable!.fromJson<T>(objectOf);
  }
}

extension ObjectModelUnwrapping on Map {
  T objectOf<T>(String key) {
    return ObjectUnwrapping(this)._objectOf(
      key: key,
      decodable: Decodable.decode,
    );
  }
}

extension UnnamedObjectModelUnwrapping on Map {
  T objectOfThis<T>() {
    return UnnamedObjectUnwrapping(this)._objectOfThis(
      decodable: Decodable.decode,
    );
  }
}
