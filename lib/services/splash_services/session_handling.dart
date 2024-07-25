import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionHandling {
  // ----------------------- Student--------------------------------
  Future<bool> saveStudentSignedInToken(String token) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('studentSignedInToken', token);
      return true; // Token saved successfully
    } catch (e) {
      if (kDebugMode) print('Error saving token: $e');
      return false; // Token not saved
    }
  }

  Future<String?> getStudentSignedInToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('studentSignedInToken');

    if (kDebugMode) {
      if (token != null) print(':::getStudentSignedInToken $token');
    }
    return token;
  }

  Future<void> removeStudentSignedInToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('studentSignedInToken');
  }

  // ----------------------- Student--------------------------------
  Future<bool> saveTeacherSignedInToken(String token) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('teacherSignedInToken', token);
      return true; // Token saved successfully
    } catch (e) {
      if (kDebugMode) print('Error saving token: $e');
      return false; // Token not saved
    }
  }

  Future<String?> getTeacherSignedInToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('teacherSignedInToken');

    if (kDebugMode) {
      if (token != null) print(':::getTeacherSignedInToken $token');
    }
    return token;
  }

  Future<void> removeTeacherSignedInToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('teacherSignedInToken');
  }

  // ----------------------- Academy--------------------------------
  Future<bool> saveAcademySignedInToken(String token) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('academySignedInToken', token);
      return true; // Token saved successfully
    } catch (e) {
      if (kDebugMode) print('Error saving token: $e');
      return false; // Token not saved
    }
  }

  Future<String?> getAcademySignedInToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('academySignedInToken');

    if (kDebugMode) {
      if (token != null) print(':::getAcademySignedInToken $token');
    }
    return token;
  }

  Future<void> removeAcademySignedInToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('academySignedInToken');
  }

  Future removeEverything() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }

  //  Future<void> saveThemeMode(ThemeModeEnum themeMode) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('themeModeKey', themeMode.index);
  // }

  // Future<ThemeModeEnum> loadThemeMode() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final themeModeIndex = prefs.getInt('themeModeKey') ?? ThemeModeEnum.system.index;
  //   return ThemeModeEnum.values[themeModeIndex];
  // }
}
