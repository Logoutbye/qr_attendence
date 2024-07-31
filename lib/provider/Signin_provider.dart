import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/core/components/session_handling.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/data/model/companySignin_Model.dart';
import 'package:qr_attendence/data/repository/academy/company.dart';
import 'package:qr_attendence/services/splash_services/session_handling.dart';

class SigninProvider extends ChangeNotifier {
  bool _isPassword = true;

  bool get isPassword => _isPassword;

  void setPasswordVisibility(bool value) {
    _isPassword = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> companySignin(
      Map<String, dynamic> data, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Assuming companysignup returns a Map<String, dynamic>
      final response = await Company().companysignin(data);
      print("::: the response of api is: $response");

      if (response['status'] == 200) {
        final msg = response['msg'];
        final success = response['success'];
        final token=response['token'];
      // final modelresponse=jsonDecode(response);
      // final token=modelresponse['token'];
      print("::: the token is hare:$token");
    SessionHandlingViewModel().saveCompanyToken(token);

        if (success == true) {
          Utils.toastMessage(msg);

          Navigator.pushReplacementNamed(context, RoutesName.hostDashboard);
        } else {
          Utils.toastMessage(msg);
        }
      } else {
        Utils.toastMessage(
            'Something went wrong. Status code: ${response['status']}');
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
      print('Error: $e');
      Utils.toastMessage("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
