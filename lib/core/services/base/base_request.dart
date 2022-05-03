// ignore_for_file: constant_identifier_names
enum HttpMethod {
  get,
  post,
  put,
  delete,
}

abstract class BaseHTTPRequest {
  String get endpoint;
  String get apiVersion;
  HttpMethod get httpMethod;
  Map<String, dynamic> get headers;
  Map<String, dynamic> get body;
  Map<String, dynamic> get params;
}

class BaseRequest implements BaseHTTPRequest {
  @override
  Map<String, dynamic> get body => <String, dynamic>{};

  @override
  String get endpoint => '';

  @override
  Map<String, dynamic> get headers => <String, dynamic>{};

  @override
  HttpMethod get httpMethod => HttpMethod.get;

  @override
  Map<String, dynamic> get params => <String, dynamic>{};

  @override
  String get apiVersion => 'v2';
}
