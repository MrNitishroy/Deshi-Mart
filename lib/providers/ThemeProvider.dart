import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  Future<void> changeTheme(ThemeMode mode) async {
    themeMode = mode;
    notifyListeners();
  }
}
