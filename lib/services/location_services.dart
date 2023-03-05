import 'dart:convert';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LocationServices {
  void postLocation(
      {required BuildContext context,
      required String userId,
      required String userName,
      required String phone,
      required String bloodGrouo,
      required num lattitude,
      required num longitude,
      required String updatedate}) async {
    try {
      http.Response res = await http
          .post(Uri.parse('http://192.168.137.1:8848/currentLocation/post'),
              body: jsonEncode({
                "userId": userId,
                "userName": userName,
                "phone": phone,
                "bloodGrouo": bloodGrouo,
                "lattitude": lattitude,
                "longitude": longitude,
                "updatedate": updatedate,
              }),
              headers: <String, String>{
            "Content-Type": "application/json;charset=UTF-8",
          });

      httpErrorHAndler(
        response: res,
        context: context,
        onSuscess: () {
          showSnackbar(
            context,
            "Your Location Will Be visible to other User",
          );
        },
      );
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

   Future<List<Map<String, dynamic>>> getLocation({
    required BuildContext context,
    required String bloodGrouo,
    required num lattitude,
    required num longitude,
    required String updatedate,
  }) async {
    var res = await http
        .post(Uri.parse('http://192.168.137.1:8848/currentLocation/getUsers'),
            body: jsonEncode({
              "bloodGrouo": bloodGrouo,
              "lattitude": lattitude,
              "longitude": longitude,
              "updatedate": updatedate,
            }),
            headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8",
        });

          if (res.statusCode == 200) {
      final List<dynamic> data = jsonDecode(res.body);
      final List<Map<String, dynamic>> locatonlist =
          data.cast<Map<String, dynamic>>().toList();
      return locatonlist;
    } else {
      throw Exception('Failed to fetch items');
    }


  }

  void updateLocation(
      {required BuildContext context,
      required String userId,
      required String userName,
      required String phone,
      required String bloodGrouo,
      required num lattitude,
      required num longitude,
      required String updatedate}) async {
    try {
      http.Response res = await http
          .post(Uri.parse('http://192.168.137.1:8848/currentLocation/update'),
              body: jsonEncode({
                "userId": userId,
                "userName": userName,
                "phone": phone,
                "bloodGrouo": bloodGrouo,
                "lattitude": lattitude,
                "longitude": longitude,
                "updatedate": updatedate,
              }),
              headers: <String, String>{
            "Content-Type": "application/json;charset=UTF-8",
          });

      httpErrorHAndler(
        response: res,
        context: context,
        onSuscess: () {
          showSnackbar(
            context,
            "Your Location Will Be Updated and Visible ",
          );
        },
      );
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  getOneId(BuildContext context, String id) async {
    final url =
        Uri.parse('http://192.168.137.1:8848/currentLocation/oneuserid');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'userId': id}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception('Internal server error');
    }
  }
}


