import '../decodable/decodable.dart';

extension ListUnwrapping on List {
  List<T> listOfThis<T>({
    required DecodableProtocol decodable,
  }) {
    final List<dynamic> _list = this;
    final List<Map<String, dynamic>> _listOf = _list
        .map((dynamic object) => Map<String, dynamic>.from(object))
        .toList();
    return decodable.fromJsonList<T>(_listOf);
  }
}

extension ListModelUnwrapping on List {
  List<T> listOfThisModel<T>() {
    return ListUnwrapping(this).listOfThis(
      decodable: Decodable.decode,
    );
  }
}
