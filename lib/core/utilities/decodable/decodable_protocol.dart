abstract class DecodableProtocol {
  T fromJson<T>(Map<String, dynamic> json);

  List<T> fromJsonList<T>(List<dynamic> jsonList);
}
