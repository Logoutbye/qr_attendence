import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/core/components/session_handling.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/data/model/total_employe_model.dart';
import 'package:qr_attendence/data/repository/academy/company.dart';

class EmployeeProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<TotalEmploye> fetchAllEmplyee(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      print("::: print 1");
      var response = await Company().listofEmployee();
      print("::: the response in provider is :${response}");

      if (response['status'] == 200) {
        print("::: print 2");
        // Directly use response instead of response.body
        final allEmployeeModel = totalEmployeFromJson(json.encode(response));
        return allEmployeeModel;
      } else {
        print("::: print 3");
        if (kDebugMode)
          print(
              "Error: Fetching All Employee with status code ${response['status']}.");
      }
    } catch (e) {
      if (kDebugMode) print("Error: Fetching All Employee: ${e.toString()}");
      throw Exception("Error fetching employees: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    throw Exception("Failed to fetch employees");
  }

  // Future<void> addEmployeesToEvent(
  //     List<String> selectedEmployeeIds, var eventid,context) async {
  //   _isLoading = true;
  //   final token = await SessionHandlingViewModel().getCompanyToken();
  //   final Map<String, dynamic> data = {
  //     "eventId": eventid,
  //     "attendees": selectedEmployeeIds
  //   }; // Replace with actual token

  //   try {
  //     final response = await Company().addEmployetoEvcent(data, token);

  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body);
  //       if (responseData["success"] == true) {
  //           Utils.toastMessage('Employees added to event successfully');
  //           Navigator.pushNamed(context, RoutesName.hostDashboard);
  //         print('Attendees added successfully');
  //       } else {
  //         print('Failed to add attendees: ${responseData['msg']}');
  //       }
        
      
  //     } else {
  //       print('Failed to add employees: ${response.body}');
  //     }
  //   } catch (e) {
  //     print('Error adding employees to event: $e');
  //   }
  // }


Future<void> addEmployeesToEvent(
    List<String> selectedEmployeeIds, var eventid, context) async {
  _isLoading = true;
  final token = await SessionHandlingViewModel().getCompanyToken();
  final Map<String, dynamic> data = {
    "eventId": eventid,
    "attendees": selectedEmployeeIds
  };

  try {
    final responseData = await Company().addEmployetoEvcent(data, token);

    if (responseData["success"] == true) {
      Utils.toastMessage('Employees added to event successfully');
      Navigator.pushNamed(context, RoutesName.hostDashboard);
      print('Attendees added successfully');
    } else {
      print('Failed to add attendees: ${responseData['msg']}');
    }
  } catch (e) {
    print('Error adding employees to event: $e');
  }
}

}
