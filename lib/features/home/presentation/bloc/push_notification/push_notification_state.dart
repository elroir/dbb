part of 'push_notification_bloc.dart';

abstract class PushNotificationState extends Equatable {
  const PushNotificationState();
}

class PushNotificationInitial extends PushNotificationState {
  @override
  List<Object> get props => [];
}

class PushNotificationAllowed extends PushNotificationState {
  @override
  List<Object> get props => [];
}

class PushNotificationNotAllowed extends PushNotificationState {
  @override
  List<Object> get props => [];
}
