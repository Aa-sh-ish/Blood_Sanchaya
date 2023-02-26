import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializatiionSetting =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  static final onNotifications = BehaviorSubject<String?>();

  Future<void> onSelectNotification(NotificationResponse? response) async {
    print('payload $response');
    if (response?.payload != null && response!.payload!.isNotEmpty) {
      onNotifications.add(response.payload);
    }
  }

  void initialiseNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializatiionSetting,
    );
    onSelectNotification:
    (payload) async {
      onNotifications.add(payload);
    };
    await _flutterLocalNotificationPlugin.initialize(initializationSettings);
  }

  Future sendNotification(
    String title,
    String body,
  ) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    _flutterLocalNotificationPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
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
