import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/core/components/session_handling.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/data/repository/Employ_repo/employ.dart';
import 'package:qr_attendence/data/repository/academy/company.dart';

class LoginEmployProvider extends ChangeNotifier{
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loginEmploy(Map<String, dynamic> data, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
 

    try {
      print("::: the print 11");
      // Assuming companysignup returns a Map<String, dynamic>
      final response = await Employ().loginEmploy(data);
   

      if (response['status'] == 200) {
        final msg = response['msg'];
        final success = response['success'];
        final token=response['token'];
        print(":::: the token of enploy is :$token");
     await SessionHandlingViewModel().saveEmploySignedInToken(token);

        if (success == true) {
          Utils.toastMessage(msg);
          print("::: the msg is: $msg");
          Navigator.pushReplacementNamed(context, RoutesName.employCheckin);
        } else {
          Utils.toastMessage(msg);
        }
      } else {
        Utils.toastMessage('Something went wrong. Status code: ${response['status']}');
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