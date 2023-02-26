// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class UserModel {
  String id;
  String name;
  String email;
  String password;
  String phoneNumber;
  String address;
  String bloodGroup;
  String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.address,
    required this.bloodGroup,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name':name,
      'password': password,
      'phoneNumber': phoneNumber,
      'address': address,
      'bloodGroup': bloodGroup,
      "token": token
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'].toString(),
      name: map['name'].toString(),
      email: map['email'].toString(),
      password: map['password'].toString(),
      phoneNumber: map['phoneNumber'].toString(),
      address: map['address'].toString(),
      bloodGroup: map['bloodGroup'].toString(),
      token: map["token"].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
