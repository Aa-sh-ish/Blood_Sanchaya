import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHAndler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuscess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuscess();
      break;
    case 400:
      showSnackbar(context, jsonDecode(response.body)["msg"]);
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
