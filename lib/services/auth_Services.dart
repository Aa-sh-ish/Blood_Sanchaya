import 'package:blood_sanchaya/models/userModel.dart';
import 'package:blood_sanchaya/utils/constraints.dart';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  void SignUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String phoneNumber,
    required String address,
    required String bloodGroup,
  }) async {
    try {
      UserModel userModel = UserModel(
        id: "",
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        address: address,
        bloodGroup: bloodGroup,
        token: "",
      );
      print(userModel.phoneNumber);

      http.Response res = await http.post(
          Uri.parse('http://192.168.137.1:8848/signin'),
          body: userModel.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json;charset=UTF-8",
          });

      httpErrorHAndler(
        response: res,
        context: context,
        onSuscess: () {
          showSnackbar(
            context,
            "Thank You Please Login And KEEP DONATING BLOOD",
          );
        },
      );
    } catch (e) {
      print(e);
      showSnackbar(context, e.toString());
    }
  }
}
