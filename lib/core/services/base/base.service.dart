import 'package:dio/dio.dart';
import 'package:pokedex/core/services/base/base.request.dart';
import '../../utilities/decodable/decodable.dart';
import '../exceptions/service_errors.dart';
import 'base.response.dart';
import 'empty.response.dart';

mixin BaseService {
  T handle<T>(BaseResponse response) {
    final int statusCode = response.statusCode;

    if (statusCode >= 200 && statusCode <= 299) {
      if (T == EmptyResponse) {
        return EmptyResponse() as T;
      }
      return Decodable.decode.fromJson<T>(response.body);
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
      return handle<T>(response as BaseResponse);
    } catch (exception) {
      throw UnexpectedError();
    }
  }
}
