
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/request_notification_permission_use_case.dart';

part 'push_notification_event.dart';
part 'push_notification_state.dart';

class PushNotificationBloc extends Bloc<PushNotificationEvent, PushNotificationState> {
  final RequestNotificationPermission _requestNotificationPermission;

  PushNotificationBloc(this._requestNotificationPermission) : super(PushNotificationInitial()) {
    on<InitPushNotification>((event, emit) async {
      final hasPermission = await _requestNotificationPermission();
      if(hasPermission) {
        emit(PushNotificationAllowed());
      } else {
        emit(PushNotificationNotAllowed());
      }
    });

    on<RequestPermission>((event, emit) async {
      final hasPermission = await _requestNotificationPermission();
      if(hasPermission) {
        emit(PushNotificationAllowed());
      } else {
        emit(PushNotificationNotAllowed());
      }
    });
  }
}