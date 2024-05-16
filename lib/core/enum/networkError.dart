enum NetworkError {
  requestTimeout,
  unauthorized,
  notFound,
  serverError,
  unknown,
}

extension NetworkErrorExtension on NetworkError {
  String get message {
    switch (this) {
      case NetworkError.requestTimeout:
        return 'Request timed out. Please try again later.';
      case NetworkError.unauthorized:
        return 'Unauthorized request. Please check your credentials.';
      case NetworkError.notFound:
        return 'Resource not found. Please try a different request.';
      case NetworkError.serverError:
        return 'Server error. Please try again later.';
      case NetworkError.unknown:
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }
}