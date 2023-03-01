import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DistrictAndBankServices {
  //GetDistricts
  getDistricts({required BuildContext context}) async {
    var res = await http
        .get(Uri.parse('http://192.168.137.1:8848/location/districts'));
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      final List<String> items = [];
      for (var item in json) {
        items.add(item);
      }
      return items;
    } else {
      throw Exception('Failed to fetch items');
    }
  }

  //GetMunicipality
  getMunicipality({
    required BuildContext context,
    required String districtName,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://192.168.137.1:8848/location/municipality'),
        body: jsonEncode({
          "districtName": districtName,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        final List<String> items = [];
        for (var item in json) {
          items.add(item);
        }

        return items;
      } else {
        throw Exception('Failed to fetch items');
      }
    } catch (e) {
      print(e);
    }
  }

//GetBloodBankName
  getBlooodBankName({
    required BuildContext context,
    required String districtName,
    required String municipalityName,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://192.168.137.1:8848/location/bloodbanksname'),
        body: jsonEncode({
          "districtName": districtName,
          "municipalityName": municipalityName
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        final List<String> items = [];
        for (var item in json) {
          items.add(item);
        }
        print("items${items}");
        return items;
      } else {
        throw Exception('Failed to fetch items');
      }
    } catch (e) {
      print(e);
    }
  }

  //Get_BloodBank_Details
  getBloodBankDetails({
    required BuildContext context,
    required String districtName,
    required String municipalityName,
    required String bankName,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://192.168.137.1:8848/location/bloodbank'),
        body: jsonEncode({
          "districtName": districtName,
          "municipalityName": municipalityName,
          "bankName": bankName,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
