import 'dart:convert';
import 'package:http/http.dart' as http;

class BloodStatusServises {
  Future<Map<String, dynamic>> getBloodBankDetails(String bankName) async {
    final response = await http.post(Uri.parse("http://192.168.137.1:8848/bloodStatus/get"), body: {
      'bankName': bankName,
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get blood bank details.');
    }
  }
}
