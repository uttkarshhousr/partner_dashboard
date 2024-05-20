// lib/repositories/partner_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:partner_dashboard/models/partner_model.dart';
import 'package:partner_dashboard/mock_api.dart'; // Import the mock API

class PartnerRepository {
  final String apiUrl = "YOUR_API_URL";

  Future<PartnerModel> fetchPartnerData() async {


    // final response = await http.get(Uri.parse(apiUrl));
    //
    // if (response.statusCode == 200) {
    //   return PartnerModel.fromJson(json.decode(response.body));
    // } else {
    //   throw Exception('Failed to load partner data');
    // }


    // Use mock data for testing
    return PartnerModel.fromJson(getMockPartnerData());
  }

  Future<List<Map<String, dynamic>>> fetchAttendanceData() async {
    // Use mock data for testing
    return getMockAttendanceData();
  }
}
