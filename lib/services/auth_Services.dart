import 'dart:convert';

import 'package:blood_sanchaya/ButtomNavi.dart';
import 'package:blood_sanchaya/Providers/userProvider.dart';
import 'package:blood_sanchaya/login.dart';
import 'package:blood_sanchaya/models/userModel.dart';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      print(userModel.toJson());
      var userKoModel = userModel.toJson();

      http.Response res = await http.post(
          Uri.parse('http://192.168.137.1:8848/signin'),
          body: userKoModel,
          headers: <String, String>{
            "Content-Type": "application/json;charset=UTF-8",
          });
      print(res);

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

//login

  void loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);

      http.Response res = await http.post(
        Uri.parse('http://192.168.137.1:8848/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHAndler(
          response: res,
          context: context,
          onSuscess: () async {
            SharedPreferences perfs = await SharedPreferences.getInstance();
            userProvider.setUser(res.body);
            await perfs.setString(
                "x-auth-token", jsonDecode(res.body)["token"]);
            navigator.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => BottonNav2()),
                (route) => false);
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

// getuserData:

  void getUserData(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      print("Token is ${token}");

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('http://192.168.137.1:8848/login/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);
      print(response);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse("http://192.168.137.1:8848/login"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );
        print(userRes.toString());

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      //showSnackbar(context, e.toString());
    }
  }

  //Signinout

  void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
      (route) => false,
    );
  }
}
