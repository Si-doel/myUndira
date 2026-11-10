import 'package:flutter/material.dart';

class AppTheme {
  static const Color navyBlue = Color(0xFF123B70);
  static const Color primaryBlue = Color(0xFF1769AA);
  static const Color skyBlue = Color(0xFF4A9FE8);
  static const Color lightBlue = Color(0xFFEAF4FF);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [navyBlue, primaryBlue, skyBlue],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: lightBlue,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: skyBlue,
        surface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: navyBlue,
        elevation: 0,
      ),
    );
  }
}
