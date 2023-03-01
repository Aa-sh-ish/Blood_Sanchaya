// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BloodBankModel {
  String bankName;
  String email;
  String phNumber;
  String location;

  BloodBankModel({
    required this.bankName,
    required this.email,
    required this.phNumber,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bankName': bankName,
      'email': email,
      'phNumber': phNumber,
      'location': location,
    };
  }

  factory BloodBankModel.fromMap(Map<String, dynamic> map) {
    return BloodBankModel(
      bankName: map['bankName'] as String,
      email: map['email'] as String,
      phNumber: map['phNumber'] as String,
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BloodBankModel.fromJson(String source) =>
      BloodBankModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MunicipalityModel {
  String municipalityName;
  List<BloodBankModel> bloodBanks;

  MunicipalityModel({
    required this.municipalityName,
    required this.bloodBanks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'municipalityName': municipalityName,
      'bloodBanks': bloodBanks.map((x) => x.toMap()).toList(),
    };
  }

  factory MunicipalityModel.fromMap(Map<String, dynamic> map) {
    return MunicipalityModel(
      municipalityName: map['municipalityName'] as String,
      bloodBanks: List<BloodBankModel>.from(
        (map['bloodBanks'] as List<int>).map<BloodBankModel>(
          (x) => BloodBankModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MunicipalityModel.fromJson(String source) =>
      MunicipalityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class DistrictModel {
  String districtName;
  List<MunicipalityModel> municipality;

  DistrictModel({
    required this.districtName,
    required this.municipality,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'districtName': districtName,
      'municipality': municipality.map((x) => x.toMap()).toList(),
    };
  }

  factory DistrictModel.fromMap(Map<String, dynamic> map) {
    return DistrictModel(
      districtName: map['districtName'] as String,
      municipality: List<MunicipalityModel>.from((map['municipality'] as List<int>).map<MunicipalityModel>((x) => MunicipalityModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory DistrictModel.fromJson(String source) => DistrictModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
