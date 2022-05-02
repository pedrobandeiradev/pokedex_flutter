class ServiceError implements Exception {}

class StatusCodeError extends ServiceError {
  final int statusCode;

  StatusCodeError({
    required this.statusCode,
  });
}

class UnauthorizedError extends ServiceError {}

class NotFoundError extends ServiceError {}

class UnexpectedError extends ServiceError {}
