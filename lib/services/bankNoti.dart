import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../utils/utils.dart';

class BankNotificationServices {
  void BankNotiPost({
    required BuildContext context,
    required String bankName,
    required String name,
    required String bloodGroup,
    required String amount,
    required String phoneNumber,
  }) async {
    try {
      http.Response res = await http.post(
          Uri.parse('http://192.168.137.1:8848/bankNotification/notification'),
          body: jsonEncode({
            "bankName": bankName,
            "bloodgroup": bloodGroup,
            "name": name,
            "Phone": phoneNumber,
            "amount": amount
          }),
          headers: <String, String>{
            "Content-Type": "application/json;charset=UTF-8",
          });

      httpErrorHAndler(
          response: res,
          context: context,
          onSuscess: () {
            showSnackbar(
                context, "Please carry a blood request letter from Hospital");
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  getBankNotification({
    required BuildContext context,
    required String bankName,
  }) async {
    http.Response res = await http.post(
        Uri.parse('http://192.168.137.1:8848/bankNotification/get'),
        body: jsonEncode({
          "bankName": bankName,
        }),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8",
        });

    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      showSnackbar(context, "No Data");
    }
  }
}
