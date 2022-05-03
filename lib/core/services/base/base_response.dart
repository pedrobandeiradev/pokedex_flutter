export 'package:pokedex/core/utilities/extension/map_json_extension.dart';

abstract class GenericBaseResponse {}

class BaseResponse<T> {
  final String endpoint;
  final int statusCode;
  final T body;
  final Map<String, dynamic> headers;

  BaseResponse({
    required this.endpoint,
    required this.statusCode,
    required this.body,
    required this.headers,
  });
}
