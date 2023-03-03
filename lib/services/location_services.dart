import 'dart:convert';
import 'package:blood_sanchaya/models/location.model.dart';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LocationServices {
  void postLocation({
    required BuildContext context,
    required String userId,
    required String lattitude,
    required String longitude,
  }) async {
    try {
      LocationModel locationModel = LocationModel(
        id: "",
        userId: userId,
        lattitude: lattitude,
        longitude: longitude,
      );

      http.Response res = await http.post(
          Uri.parse('http://192.168.137.1:8848/currentLocation/Location'),
          body: locationModel.toJson(),
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

  Future<List<Map<String, dynamic>>> getLocation() async {
    var res = await http
        .get(Uri.parse('http://192.168.137.1:8848/currentLocation/Location'));
    if (res.statusCode == 200) {
      final List<dynamic> data = jsonDecode(res.body);
      final List<Map<String, dynamic>> locatonlist =
          data.cast<Map<String, dynamic>>().toList();
      return locatonlist;
    } else {
      throw Exception('Failed to fetch items');
    }
  }
}
