
import '../../../../core/push_notification/push_notification_repository.dart';

class RequestNotificationPermission{
  final PushNotificationRepository _notificationRepository;

  RequestNotificationPermission({required PushNotificationRepository notificationRepository}) : _notificationRepository = notificationRepository;


  Future<bool> call() async {
    return await _notificationRepository.requestNotificationPermission();
  }
}