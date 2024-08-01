import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/core/components/session_handling.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/data/model/all_length_model.dart';
import 'package:qr_attendence/data/model/fetch_all_event_model.dart';
import 'package:qr_attendence/data/repository/academy/company.dart';

class GeneralProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> logout(BuildContext context) async {
    print("::: print 1");
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final token=await SessionHandlingViewModel().getCompanyToken();
print("::: the token of logout is :$token");
    try {
      final response = await Company().logout(token);

      if (response['success'] == true) {
         print("::: print 2");
        final msg=response['msg'];
        // Handle successful logout
        Utils.toastMessage(msg);
           Navigator.pushReplacementNamed(context, RoutesName.signin);
        print("Logout successful");
      } else {
         print("::: print 3");
        _errorMessage = 'Failed to logout. Status code: ${response['status']}';
        print(_errorMessage);
      }
    } catch (e) {
       print("::: print 4");
      _errorMessage = 'An error occurred during logout. Please try again.';
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }



Future<AllLength> fetchAllLength(BuildContext context) async {
  _isLoading = true;
  notifyListeners();

  try {
    print("::: print 1");
    final response = await Company().AllLengthforcompany(); // Expecting Map<String, dynamic> here
    print("::: the response in provider is :${response}");

    if (response['status'] == 200) {
      print("::: print 2");
      final allEmployeeModel = AllLength.fromJson(response as Map<String, dynamic>);
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


Future<FetchAllEventModel> FetchAllEvents(BuildContext context) async {
  _isLoading = true;
  notifyListeners();

  try {
    print("::: print 1");
    var response = await Company().FetchAllEvents();
    print("::: the response in provider is :${response}");

    if (response['status'] == 200) {
      print("::: print 2");
      // Directly use response instead of response.body
      final allEmployeeModel = fetchAllEventModelFromJson(json.encode(response));
      return allEmployeeModel;
    } else {
      print("::: print 3");
      if (kDebugMode)
        print("Error: Fetching All Event with status code ${response['status']}.");
    }
  } catch (e) {
    if (kDebugMode) print("Error: Fetching All Events: ${e.toString()}");
    throw Exception("Error fetching employees: $e");
  } finally {
    _isLoading = false;
    notifyListeners();
  }
  throw Exception("Failed to fetch events");
}

}
