import 'package:flutter/material.dart';

class SettingsProviders extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.dark;
  String currentlang = "en";
  void changeLocal(String newlang) {
    currentlang = newlang;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    currentTheme = newMode;
    notifyListeners();
  }

  bool isEn() {
    return currentlang == 'en';
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark;
  }
}
