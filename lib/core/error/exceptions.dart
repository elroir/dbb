class NoInternetException implements Exception{}

class ServerException implements Exception{}

class CacheException implements Exception{}

class AuthorizationException implements Exception{}

class ValidationException implements Exception{
  final String message;
  ValidationException(this.message);
}

class PushNotificationException implements Exception{}

class NotFoundException implements Exception{}
