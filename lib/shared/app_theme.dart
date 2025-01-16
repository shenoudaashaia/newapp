import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFF39A552);
  static const navy = Color(0xFF4F5A69);
  static const gray = Color(0xFF79828B);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF303030);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppTheme.primary,
      centerTitle: true,
      foregroundColor: AppTheme.white,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32),),
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
