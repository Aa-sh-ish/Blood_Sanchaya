// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  //NotificationApi();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializatiionSetting =
      AndroidInitializationSettings('logo');

  void initialiseNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializatiionSetting,
    );
    await _flutterLocalNotificationPlugin.initialize(initializationSettings);
  }

  Future sendNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    _flutterLocalNotificationPlugin.show(0, title, body, notificationDetails);
  }

  Future scheduleNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    _flutterLocalNotificationPlugin.periodicallyShow(
        0, title, body, RepeatInterval.everyMinute, notificationDetails);
  }

  Future stopNotification() async {
    _flutterLocalNotificationPlugin.cancel(0);
  }
}





















// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';

// class NotificationApi {
//   NotificationApi();
//   static final _notifications = FlutterLocalNotificationsPlugin();
//   static final onNotifications = BehaviorSubject<String?>();

//   static Future _notificationDetails() async {
//     return NotificationDetails(
//       android: AndroidNotificationDetails(
//           'channel id', 'channel name', 
//           importance: Importance.max, priority: Priority.max, playSound: true),
//     );
//   }

//   static Future init({bool initScheduled = false}) async {
//     final android = AndroidInitializationSettings('logo');
//     final settings = InitializationSettings(android: android);

//     await _notifications.initialize(
//       settings,
//     );
//   }

//   static Future showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async =>
//       _notifications.show(
//         id,
//         title,
//         body,
//         await _notificationDetails(),
//         payload: payload,
//       );

//   //  void onDidReceiveLocalNotification(
//   //     int id, String? title, String? body, String? payload) {
//   //   print('id $id');
//   // }

//   // Future<dynamic> onSelectNotification(NotificationResponse? response) async {
//   //   print('payload $response');
//   //   if (response?.payload != null && response!.payload!.isNotEmpty) {
//   //     onNotifications.add(response.payload);
//   //   }
//   // }
// }
