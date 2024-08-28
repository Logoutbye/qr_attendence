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

  Future<void> removeCompanyToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
  }
   Future removecompany() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    // notifyListeners();
    return sp.clear();
  }

  // for signed in rider

  Future<bool> saveEmploySignedInToken(String token) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('token', token);
      return true; // Token saved successfully
    } catch (e) {
      print('Error saving token: $e');
      return false; // Token not saved
    }
  }

  Future<String?> getemploySignedInToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    if (kDebugMode) {
      if (token != null) print(':::getemploySignedInToken $token');
    }
    return token;
  }

  Future<void> removeEmploySignedInToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
  }

    Future removeEmployee() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    // notifyListeners();
    return sp.clear();
  }
  // for signed in user



 

 
  // Future<void> removePassengerSignedToken() async {
  //   final SharedPreferences sp = await SharedPreferences.getInstance();
  //   sp.remove('savePassengerSignedInToken');
  // }

  Future removeEverything() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
