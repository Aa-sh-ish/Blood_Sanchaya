// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class UserModel {
    String id;
    String email;
    String password;
    String phoneNumber;
    String address;
    String bloodGroup;
    String token;


  UserModel({
    required this.id,
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
      'password': password,
      'phoneNumber': phoneNumber,
      'address': address,
      'bloodGroup': bloodGroup,
      "token":token
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      address: map['address'] as String,
      bloodGroup: map['bloodGroup'] as String,
      token: map["token"] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
