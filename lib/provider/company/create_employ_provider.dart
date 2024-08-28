import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/core/components/session_handling.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/data/repository/academy/company.dart';
import 'package:qr_attendence/view/screens/Host/total_employes.dart';

class CreateEmployProvider extends ChangeNotifier{
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> CreateEmploy(Map<String, dynamic> data, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    final token =await SessionHandlingViewModel().getCompanyToken();
    print(":::: the token of company is hare:$token");

    try {
      print("::: the print 11");
      // Assuming companysignup returns a Map<String, dynamic>
      final response = await Company().createEmploy(data,token);
      print("::: the response of api is: $response");

      if (response['status'] == 201) {
        final msg = response['msg'];
        final success = response['success'];

        if (success == true) {
          Utils.toastMessage(msg);
          print("::: the msg is: $msg");
         Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EmployeeListScreen(showButton: false),
                        ),
                      );
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