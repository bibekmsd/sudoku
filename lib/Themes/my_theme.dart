import 'package:flutter/material.dart';

class MyTheme {
  // Color Palette
  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color primaryIndigo = Color(0xFF3F51B5);
  static const Color accentTeal = Color(0xFF00BCD4);
  static const Color accentAmber = Color(0xFFFF9800);
  static const Color surfaceLight = Color(0xFFFAFAFA);
  static const Color surfaceDark = Color(0xFF121212);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E1E1E);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primaryBlue,
      secondary: accentTeal,
      tertiary: accentAmber,
      surface: surfaceLight,
      onSurface: Color(0xFF1C1B1F),
      surfaceContainerHighest: Color(0xFFE6E0E9),
      onSurfaceVariant: Color(0xFF49454F),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: cardLight,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Color(0xFF1C1B1F),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 8,
      backgroundColor: cardLight,
      selectedItemColor: primaryBlue,
      unselectedItemColor: const Color(0xFF49454F),
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1C1B1F),
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1C1B1F),
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1C1B1F),
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1C1B1F),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xFF1C1B1F),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFF49454F),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: primaryBlue,
      secondary: accentTeal,
      tertiary: accentAmber,
      surface: surfaceDark,
      onSurface: Color(0xFFE6E1E5),
      surfaceContainerHighest: Color(0xFF2B2930),
      onSurfaceVariant: Color(0xFFCAC4D0),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: cardDark,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Color(0xFFE6E1E5),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 8,
      backgroundColor: cardDark,
      selectedItemColor: primaryBlue,
      unselectedItemColor: const Color(0xFFCAC4D0),
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE6E1E5),
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFFE6E1E5),
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFFE6E1E5),
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xFFE6E1E5),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xFFE6E1E5),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFFCAC4D0),
      ),
    ),
  );
}

// Legacy theme variables for backward compatibility
ThemeData lightMode = MyTheme.lightTheme;
ThemeData darkMode = MyTheme.darkTheme;
