import 'dart:convert';

import 'package:blood_sanchaya/BB.dart';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BloodBank {
  void LoginBloodBank({
    required BuildContext context,
    required String BankName,
    required String adminPassword,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://192.168.137.1:8848/adminLogin'),
        body: jsonEncode({
          'BankName': BankName,
          'adminPassword': adminPassword,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHAndler(response: res, context: context, onSuscess: () {
        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Blood_Banks(bbName: BankName)),
                  );
      });
    } catch (err) {
      showSnackbar(context, err.toString());
    }
  }
}
