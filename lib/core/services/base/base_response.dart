export 'package:pokedex/core/utilities/extension/map_json_extension.dart';

import 'package:dio/dio.dart';

abstract class GenericBaseResponse {}

class BaseResponse<T> extends Response with GenericBaseResponse {
  final String endpoint;
  final T body;

  BaseResponse({
    required this.endpoint,
    required this.body,
  }) : super(
            requestOptions: RequestOptions(
          path: endpoint,
          data: body,
        ));
}
