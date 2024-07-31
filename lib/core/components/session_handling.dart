import 'package:flutter/foundation.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SessionHandlingViewModel {
  // for on boarding screen



  // for rider registration
  Future<bool> saveCompanyToken(String token) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('token', token);
      return true; // Token saved successfully
    } catch (e) {
      print('Error saving token: $e');
      return false; // Token not saved
    }
  }

  Future<String?> getCompanyToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    if (kDebugMode) {
      if (token != null) print(':::getDriverRegistrationToken $token');
    }
    return token;
  }

  Future<void> removeDriverRegistrationToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('DriverRegistrationToken');
  }

  // for signed in rider

  Future<bool> saveEmploySignedInToken(String token) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('saveDriverSignedInToken', token);
      return true; // Token saved successfully
    } catch (e) {
      print('Error saving token: $e');
      return false; // Token not saved
    }
  }

  Future<String?> getemploySignedInToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('saveDriverSignedInToken');
    if (kDebugMode) {
      if (token != null) print(':::getDriverSignedInToken $token');
    }
    return token;
  }

  Future<void> removeDriverSignedInToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('saveDriverSignedInToken');
  }
  // for signed in user



 

 
  Future<void> removePassengerSignedToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('savePassengerSignedInToken');
  }

  Future removeEverything() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
