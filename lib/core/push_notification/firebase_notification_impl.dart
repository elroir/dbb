import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'push_notification_repository.dart';

class FirebaseNotificationImpl extends PushNotificationRepository{

  final StreamController<Map<String,dynamic>> _messageStream = StreamController.broadcast();

  @override
  Stream<Map<String, dynamic>> get onNotificationReceived => _messageStream.stream;



  @override
  Future<String?> getDeviceToken()async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      rethrow;
    }

  }

  @override
  Future<void> init() async {

    await requestNotificationPermission();

    try {
      FirebaseMessaging.onMessage.listen(_onMessageHandler);
      FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    } catch (e) {
      rethrow;
    }


    // FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
  }

  @override
  Future<bool> requestNotificationPermission() async {
    final permission = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    return permission.authorizationStatus == AuthorizationStatus.authorized;
  }

  // Future<void> _onBackgroundHandler(RemoteMessage message) async {
  //   _messageStream.add(message.data);
  // }

  Future _onMessageHandler(RemoteMessage message) async {
    print(message);
    _messageStream.add(message.data);
  }

   Future _onMessageOpenApp(RemoteMessage message) async {
     _messageStream.add(message.data);
  }

  @override
  void dispose() {
    _messageStream.close();
  }


}