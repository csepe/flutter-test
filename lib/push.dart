// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

class PushNotificationService {
  final FirebaseMessaging _fcm;

  PushNotificationService(this._fcm);

  Future initialise() async {
    printWarning("FCM initialising");
    // If you want to test the push notification locally,
    // you need to get the token and input to the Firebase console
    // https://console.firebase.google.com/project/YOUR_PROJECT_ID/notification/compose
    printWarning(_fcm.toString());
    String? token = await _fcm.getToken();
    printWarning("FirebaseMessaging token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //RemoteNotification? notification = message.notification;
      //showNotification(notification);
      print("onMessage: $message");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp: $message");
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) {
      print("onBackgroundMessage: $message");
      return null as Future<void>;
    });
  }
}
