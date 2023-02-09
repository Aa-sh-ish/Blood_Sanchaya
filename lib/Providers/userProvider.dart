import 'package:blood_sanchaya/models/userModel.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel _userModel = UserModel(
    id: "",
    email: "",
    password: "",
    phoneNumber: "",
    address: "",
    bloodGroup: "",
    token: "",
  );

  UserModel get userModel => _userModel;

  void setUser(String userModel) {
    _userModel = UserModel.fromJson(userModel);
    notifyListeners();
  }

  void setUserFromModel(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }
}
