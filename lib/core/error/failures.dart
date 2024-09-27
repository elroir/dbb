
import 'error_messages.dart';

abstract class Failure{

  final String errorMessage;
  
  const Failure({
    this.errorMessage = ''
  });


}

//General failures
class ServerFailure extends Failure{

  ServerFailure({super.errorMessage = ErrorMessages.serverFailureError});

}

class SocketFailure extends Failure{
  SocketFailure({super.errorMessage = ErrorMessages.noInternetError});


}

class CacheFailure extends Failure{
  CacheFailure({super.errorMessage = ErrorMessages.serverFailureError});
}

class NullFailure extends Failure{
  NullFailure({required super.errorMessage});
}

class PushNotificationFailure extends Failure{}


class ValidationFailure extends Failure{
  ValidationFailure({required super.errorMessage});
}

class LocationPermissionFailure extends Failure{
  LocationPermissionFailure({super.errorMessage = ErrorMessages.locationPermissionMessageError});
}

class LocationServicesFailure extends Failure{}

class PermissionFailure extends Failure{
  PermissionFailure({super.errorMessage = ErrorMessages.noInternetError});
}


class NotFoundFailure extends Failure{
  NotFoundFailure({super.errorMessage = ErrorMessages.notFoundMessageError});
}
