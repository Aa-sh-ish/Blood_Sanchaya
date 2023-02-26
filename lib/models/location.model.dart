import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocationModel {
      String id;
     String userId;
     String lattitude;
     String longitude;

  LocationModel({
    required this.id,
    required this.userId,
    required this.lattitude,
    required this.longitude,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'lattitude': lattitude,
      'longitude': longitude,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      id: map['_id'] as String,
      userId: map['userId'] as String,
      lattitude: map['lattitude'] as String,
      longitude: map['longitude'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) => LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
