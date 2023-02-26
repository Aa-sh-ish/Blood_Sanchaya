import 'dart:convert';
import 'package:blood_sanchaya/models/notification.model.dart';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationServices {
  void postNotification({
    required BuildContext context,
    required String name,
    required String district,
    required String municipality,
    required String bloodGroup,
    required String bloodPint,
    required String phoneNumber,
  }) async {
    try {
      NotificationModel notificationModel = NotificationModel(
        name: name,
        disrict: district,
        municipality: municipality,
        bloodGroup: bloodGroup,
        bloodPint: bloodPint,
        phoneNumber: phoneNumber,
      );
      print(notificationModel);

      http.Response res = await http.post(
          Uri.parse('http://192.168.137.1:8848/Post/help'),
          body: notificationModel.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json;charset=UTF-8",
          });

      httpErrorHAndler(
          response: res,
          context: context,
          onSuscess: () {
            showSnackbar(context, "Hope You Get the Blood Soon");
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  getNotification({required BuildContext context}) async {
    var res = await http.get(Uri.parse('http://192.168.137.1:8848/Post'));
    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      showSnackbar(context, "value Required");
    }
  }
}
