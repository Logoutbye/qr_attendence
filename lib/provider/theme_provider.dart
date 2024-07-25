import 'package:flutter/material.dart';

enum ThemeModeEnum { system, light, dark }

class ThemeProvider with ChangeNotifier {
  ThemeModeEnum _themeMode = ThemeModeEnum.system;

  ThemeModeEnum get themeMode => _themeMode;

  void setThemeMode(ThemeModeEnum themeMode) {
    _themeMode = themeMode;
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
}
