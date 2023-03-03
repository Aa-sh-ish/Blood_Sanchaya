import 'dart:convert';

import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DonateDateServices {
  void postDonateDate({
    required BuildContext context,
    required String donateDate,
    required String userId,
    required String nextDonateDate,
  }) async {
    try {
      http.Response res = await http
          .post(Uri.parse('http://192.168.137.1:8848/donatedate/post'),
              body: jsonEncode({
                "userId": userId,
                "donateDate": donateDate,
                "nextDonateDate": nextDonateDate,
              }),
              headers: <String, String>{
            "Content-Type": "application/json;charset=UTF-8",
          });

      httpErrorHAndler(
          response: res,
          context: context,
          onSuscess: () {
            return json.decode(res.body);
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  getDonateDate({
    required BuildContext context,
    required String userId,
  }) async {
    try {
      http.Response res = await http.post(
          Uri.parse('http://192.168.137.1:8848/donatedate/get'),
          body: jsonEncode({"userId": userId}),
          headers: <String, String>{
            "Content-Type": "application/json;charset=UTF-8",
          });

      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void updateDonateDate({
    required BuildContext context,
    required String donateDate,
    required String userId,
    required String nextDonateDate,
  }) async {
    try {
      http.Response res = await http
          .post(Uri.parse('http://192.168.137.1:8848/donatedate/update'),
              body: jsonEncode({
                "userId": userId,
                "donateDate": donateDate,
                "nextDonateDate": nextDonateDate,
              }),
              headers: <String, String>{
            "Content-Type": "application/json;charset=UTF-8",
          });

      httpErrorHAndler(
          response: res,
          context: context,
          onSuscess: () {
            return json.decode(res.body);
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
