import 'dart:convert';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BloodStatusServises {
  Future<Map<String, dynamic>> getBloodBankDetails(String bankName) async {
    final response = await http
        .post(Uri.parse("http://192.168.137.1:8848/bloodStatus/get"), body: {
      'bankName': bankName,
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get blood bank details.');
    }
  }

  void postBloodStatus({
    required BuildContext context,
    required String bankName,
    required String A_P,
    required String A_N,
    required String B_P,
    required String B_N,
    required String AB_P,
    required String AB_N,
    required String O_P,
    required String O_N,
  }) async {
    try {
      http.Response res = await http
          .post(Uri.parse('http://192.168.137.1:8848/bloodStatus/add'),
              body: jsonEncode({
                "bankName": bankName,
                "A+": A_P,
                "A-": A_N,
                "B+": B_P,
                "B-": B_N,
                "AB+": AB_P,
                "AB-": AB_N,
                "O+": O_P,
                "O-": O_N,
              }),
              headers: <String, String>{
            "Content-Type": "application/json;charset=UTF-8",
          });
      if (res.statusCode == 200) {
        showSnackbar(context, "Blood Status Posted");
      }
    } catch (e) {
        showSnackbar(context, e.toString());
    }
  }

  void updateBloodStatus({
    required BuildContext context,
    required String bankName,
    required String A_P,
    required String A_N,
    required String B_P,
    required String B_N,
    required String AB_P,
    required String AB_N,
    required String O_P,
    required String O_N,
  }) async {
    try {
      http.Response res = await http
          .post(Uri.parse('http://192.168.137.1:8848/bloodStatus/updateStatus'),
              body: jsonEncode({
                "bankName": bankName,
                "A+": A_P,
                "A-": A_N,
                "B+": B_P,
                "B-": B_N,
                "AB+": AB_P,
                "AB-": AB_N,
                "O+": O_P,
                "O-": O_N,
              }),
              headers: <String, String>{
            "Content-Type": "application/json;charset=UTF-8",
          });

          if (res.statusCode == 200) {
        showSnackbar(context, "Blood Status Updated");
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  getOneBankName(BuildContext context, String bankName) async {
    final url = Uri.parse('http://192.168.137.1:8848/bloodStatus/onebankName');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'bankName': bankName}),
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
