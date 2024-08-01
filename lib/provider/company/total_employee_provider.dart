import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
        print("Error: Fetching All Employee with status code ${response['status']}.");
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

}
