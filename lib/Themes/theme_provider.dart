import 'package:flutter/material.dart';
import 'package:practise_flutter/Themes/my_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  set setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      setThemeData = darkMode;
    } else {
      setThemeData = lightMode;
    }
  }
}
