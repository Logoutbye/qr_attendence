import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:qr_attendence/core/components/session_handling.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/data/model/total_employe_model.dart';
import 'package:qr_attendence/data/repository/Employ_repo/employ.dart';
import 'package:qr_attendence/view/screens/employes/employ_checkout.dart';
import 'package:qr_attendence/view/screens/employes/employes_checkin.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CheckinProvider extends ChangeNotifier {
  bool _isloading = false;

  bool get isloading => _isloading;
  void setLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  String _name = '';
  String _code = '';
  Barcode? _qrResult;
  void get code => _code;
  void get name => _name;
  void get qrresult => _qrResult;
  void setname(String value) {
    _name = value;
    notifyListeners();
  }

  void setcode(String code) {
    _code = code;
    notifyListeners();
  }

  void setqrcode(value) {
    _qrResult = value;
    notifyListeners();
  }

Future<dynamic> checkIn(
    Map<String, dynamic> data, var result, BuildContext context,String companycode) async {
      print(":::: the result is :$result");
  try {
    final token = await SessionHandlingViewModel().getemploySignedInToken();
    print(":::: the token of emplot is hare:$token");

    // Fetch the API response, which is expected to be a decoded map
    final response = await Employ().checkin(data, token);
    print("::: the response of api is :$response");

    // Ensure that response is indeed a Map<String, dynamic>
    if (response is Map<String, dynamic>) {
      // Check for the expected keys in the response
      final msg = response['msg'];
      // final companyname=response['company'];
      
      if (response['success'] == true&&result==companycode) {
        Utils.toastMessage(msg);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const CheckInCheckOutScreen()),
        );
      } else {
        // Handle when the status is false
        Utils.toastMessage('Check-in failed:qr is not match with desired company');
      }
    } else {
      // Handle unexpected response structure
      print('Unexpected response structure: $response');
      Utils.toastMessage('Unexpected response from server.');
    }
  } catch (e) {
    print('Error during check-in: $e');
    Utils.toastMessage('Error during check-in: $e');
  }
}

Future<dynamic> checkOut(BuildContext context, Map<String, dynamic> data) async {
  try {
    // Fetch the token (assuming you have a method to get it)
    final token = await SessionHandlingViewModel().getemploySignedInToken();
    print(":::: the token of employee is here: $token");

    // Fetch the API response, which is expected to be a decoded map
    final response = await Employ().checkout(data, token);
    print("::: the response of API is: $response");

    // Ensure that response is indeed a Map<String, dynamic>
    if (response is Map<String, dynamic>) {
      // Check for the expected keys in the response
      final msg = response['msg'];

      if (response['success'] == true) {
        Utils.toastMessage(msg);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Employescheckin()),
        );
      } else {
        // Handle when the status is false
        Utils.toastMessage('Checkout failed: $msg');
        print(":::::: error : $msg");
      }
    } else {
      // Handle unexpected response structure
      print('Unexpected response structure: $response');
      Utils.toastMessage('Unexpected response from server.');
    }
  } catch (e) {
    print('Error during checkout: $e');
    Utils.toastMessage('Error during checkout: $e');
  }
}

}
