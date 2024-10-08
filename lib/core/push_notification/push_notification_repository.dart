
abstract class PushNotificationRepository{
  Future<void> init();
  void dispose();
  Future<bool> requestNotificationPermission();
  Future<String?> getDeviceToken();
  Stream<Map<String,dynamic>?> get onNotificationReceived;
}