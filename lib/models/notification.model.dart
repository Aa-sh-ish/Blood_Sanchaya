import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotificationModel {
  String name;
  String disrict;
  String municipality;
  String bloodGroup;
  String bloodPint;
  String phoneNumber;

  NotificationModel({
    required this.name,
    required this.disrict,
    required this.municipality,
    required this.bloodGroup,
    required this.bloodPint,
    required this.phoneNumber,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'disrict': disrict,
      'municipality': municipality,
      'bloodGroup': bloodGroup,
      'bloodPint': bloodPint,
      'phoneNumber': phoneNumber,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      name: map['name'] as String,
      disrict: map['disrict'] as String,
      municipality: map['municipality'] as String,
      bloodGroup: map['bloodGroup'] as String,
      bloodPint: map['bloodPint'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) => NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
