import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeEnum { system, light, dark }

class ThemeProvider with ChangeNotifier {
  ThemeModeEnum _themeMode = ThemeModeEnum.system;

  ThemeProvider() {
    _loadThemeMode();
  }

  ThemeModeEnum get themeMode => _themeMode;

void setThemeMode(ThemeModeEnum themeMode) async {
  _themeMode = themeMode;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('themeMode', themeMode.toString());
  notifyListeners();
}

  ThemeMode getThemeMode() {
    switch (_themeMode) {
      case ThemeModeEnum.light:
        return ThemeMode.light;
      case ThemeModeEnum.dark:
        return ThemeMode.dark;
      case ThemeModeEnum.system:
      default:
        return ThemeMode.system;
    }
  }

  void _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeModeString = prefs.getString('themeMode');
    if (themeModeString != null) {
      _themeMode = ThemeModeEnum.values.firstWhere((element) => element.toString() == themeModeString);
      notifyListeners();
    }
  }
}
