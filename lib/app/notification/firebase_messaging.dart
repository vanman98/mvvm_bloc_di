import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification.dart';

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  print("OnBackgroundMessage: $message");
  return FirebaseCloudMessaging._handler(message);
}

class FirebaseCloudMessaging {
  static final FirebaseMessaging instance = FirebaseMessaging.instance;

  static initFirebaseMessaging() async {
    instance.requestPermission();
    FirebaseMessaging.onMessage.listen((message) async {
      print("OnMessage: ${message.notification!.title}");
      _handler(message, onlyShow: true);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("OnMessageOpenedApp: ${message.notification!.title}");
      _handler(message);
    });
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  }

  static _handler(RemoteMessage message, {bool onlyShow = false}) async {
    Map<String, dynamic> payload = message.data;
    if (onlyShow) {
      print("HANDLER NOTFIY");
      LocalNotification.showNotification(message.notification?.title,
          message.notification?.body, '${jsonEncode(payload)}');
    } else {
      selectNotificationSubject.add(jsonEncode(payload));
    }
  }
}
