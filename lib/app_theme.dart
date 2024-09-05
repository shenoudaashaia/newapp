import 'package:flutter/material.dart';

class AppTheme {
  static const Primary = Color(0xFF39A552);
  static const navy = Color(0xFF4F5A69);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF303030);
  static ThemeData lightTheme = ThemeData(
    primaryColor: Primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppTheme.Primary,
      centerTitle: true,
      foregroundColor: AppTheme.white,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(32), right: Radius.circular(32)),
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
