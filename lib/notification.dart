import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi {
  NotificationApi();
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name',
          channelDescription: 'Open Details',
          importance: Importance.max,
          priority: Priority.max,
          playSound: true),
    );
  }

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings = InitializationSettings(android: android);

    await _notifications.initialize(
      settings,
      onSelectNotification:(payload)async{
        onNotifications.add(payload)
      },
        );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );

  //  void onDidReceiveLocalNotification(
  //     int id, String? title, String? body, String? payload) {
  //   print('id $id');
  // }

  Future<void> onSelectNotification(NotificationResponse? response) async {
    print('payload $response');
    if (response?.payload != null && response!.payload!.isNotEmpty) {
      onNotifications.add(response.payload);
    }
  }

}
