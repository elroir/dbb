part of 'push_notification_bloc.dart';

abstract class PushNotificationEvent extends Equatable {
  const PushNotificationEvent();
}

class InitPushNotification extends PushNotificationEvent {
  @override
  List<Object?> get props => [];
}

class RequestPermission extends PushNotificationEvent {
  @override
  List<Object?> get props => [];
}