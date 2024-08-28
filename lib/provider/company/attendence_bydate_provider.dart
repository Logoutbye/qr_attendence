import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_attendence/core/components/session_handling.dart';
import 'package:qr_attendence/data/model/fetch_all_employe_Attendece_byDate_model.dart';
import 'dart:convert';

import 'package:qr_attendence/data/repository/academy/company.dart';

// Import your model here

class AttendanceByDateProvider with ChangeNotifier {
  bool _isLoading = false;
  List<AttendanceRecord> _attendanceList = [];

  bool get isLoading => _isLoading;
  List<AttendanceRecord> get attendanceList => _attendanceList;

Future<void> fetchAttendanceByDate(String date) async {
  _isLoading = true;
  notifyListeners();

  final token = await SessionHandlingViewModel().getCompanyToken();
  print("::: the token of attendance: $token");

  try {
    print("::: the date of attendance is: $date");
    Map<String, dynamic> data = {"date": date};
    final response = await Company().fetchattendenceBYDate(data, token);

    // Check if response is a Map
    if (response is Map<String, dynamic>) {
      print("::: the response of attendance by date is: ${jsonEncode(response)}");

      // Check if the response contains the expected keys
      if (response['status'] == 200 && response.containsKey('attendanceRecords')) {
        // Parse the JSON response into your model
        final result = FetchAllEmployAttendeceByDate.fromJson(response);
        _attendanceList = result.attendanceRecords;
      } else {
        print('Failed to fetch attendance: ${jsonEncode(response)}');
        _attendanceList = []; // Clear the list on error
      }
    } else {
      print('Unexpected response type: ${response.runtimeType}');
      _attendanceList = []; // Clear the list on error
    }
  } catch (error) {
    print('Error occurred: $error');
    _attendanceList = []; // Clear the list on error
  } finally {
    _isLoading = false;
    notifyListeners();
  }
}
}

