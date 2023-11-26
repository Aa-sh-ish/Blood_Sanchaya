import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:http/http.dart' as http;

 httpErrorHAndler({
  required http.Response response,
  required BuildContext context,
  required  onSuscess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuscess();
      break;
    case 400:
      showSnackbar(context, jsonDecode(response.body)["message"]);
      break;
      case 404:
      showSnackbar(context, "Not Allowed");
      break;
    case 500:
      showSnackbar(context, jsonDecode(response.body)["error"]);
      break;
    default:
      showSnackbar(context, response.body);
  }
}

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

void callNumber(String number) async {
  await FlutterPhoneDirectCaller.callNumber(number);
}
