// ignore_for_file: use_build_context_synchronously



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/core/components/session_handling.dart';

class SplashServices {


  Future<String?> getCompanyToken() =>
      SessionHandlingViewModel().getCompanyToken();

  Future<String?> getEmploySignedInToken() =>
      SessionHandlingViewModel().getemploySignedInToken();

  

  void checkAuthentication(BuildContext context) async {
    try {
 
     
      final signedIncompanyToken = await getCompanyToken();
      final signedInEmployToken = await getEmploySignedInToken();
      print(":: the token of company is :${signedIncompanyToken}");

      if (signedIncompanyToken != null) {
        // If signed in,
        Navigator.pushReplacementNamed(context, RoutesName.hostDashboard);
      } else if (signedInEmployToken != null) {
        Navigator.pushReplacementNamed(context, RoutesName.employCheckin);
      } else {
        // If not signed in,
        Navigator.pushReplacementNamed(context, RoutesName.selectRole);
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
