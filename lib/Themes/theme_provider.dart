import 'package:flutter/material.dart';
import 'package:practise_flutter/Themes/my_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = MyTheme.lightTheme;
  
  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == MyTheme.darkTheme;

  set setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == MyTheme.lightTheme) {
      setThemeData = MyTheme.darkTheme;
    } else {
      setThemeData = MyTheme.lightTheme;
    }
  }
}
