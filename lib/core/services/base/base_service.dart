import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/core/services/base/base_request.dart';
import '../../utilities/decodable/decodable.dart';
import '../exceptions/service_errors.dart';
import 'empty_response.dart';

mixin BaseService {
  T handle<T>(Response response) {
    final int statusCode = response.statusCode ?? 500;

    if (statusCode >= 200 && statusCode <= 299) {
      if (T == EmptyResponse) {
        return EmptyResponse() as T;
      }
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      return Decodable.decode.fromJson<T>(json);
    }

    if (statusCode >= 300 && statusCode < 400) {
      throw StatusCodeError(statusCode: statusCode);
    }

    if (statusCode == 401 || statusCode == 403) {
      throw UnauthorizedError();
    }

    if (statusCode == 404) {
      throw NotFoundError();
    }

    throw UnexpectedError();
  }

  Future<T> execute<T>({
    required BaseHTTPRequest request,
    required Dio provider,
  }) async {
    try {
      const String baseURL = 'https://pokeapi.co/api/';
      final String requestPath =
          baseURL + request.apiVersion + request.endpoint;
      final response = await provider.get(
        requestPath,
        queryParameters: request.params,
      );
      return handle<T>(response);
    } catch (exception) {
      throw UnexpectedError();
    }
  }
}
