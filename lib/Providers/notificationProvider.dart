import 'package:blood_sanchaya/models/notification.model.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  NotificationModel _notificationModel = NotificationModel(
    disrict: "",
    municipality: "",
    bloodGroup: "",
    bloodPint: "",
    phoneNumber: "",
  );

  NotificationModel get notificationModel => _notificationModel;

  void setNotification (String notificationModel) {
    _notificationModel = NotificationModel.fromJson(notificationModel);
    notifyListeners();
  }

  void setNotificationFromModel(NotificationModel notificationModel){
    _notificationModel = notificationModel;
    notifyListeners();
  }
}
