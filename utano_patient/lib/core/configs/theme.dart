import 'package:flutter/material.dart';

import 'configs.dart';

class AppTheme {
  final String fontFamily = 'Poppins';
  final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      color: UtanoColors.light.withOpacity(0.8),
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    labelStyle: TextStyle(
      color: UtanoColors.light.withOpacity(0.8),
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: UtanoColors.light,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: UtanoColors.light.withOpacity(0.6),
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: UtanoColors.light.withOpacity(0.6),
      ),
    ),
  );

  ThemeData get darkTheme => ThemeData(
        primaryColor: UtanoColors.primary,
        fontFamily: fontFamily,
        scaffoldBackgroundColor: UtanoColors.darkSecondary,
        useMaterial3: true,
        inputDecorationTheme: inputDecorationTheme,
      );

  ThemeData get lightTheme => ThemeData(
        primaryColor: UtanoColors.primary,
        fontFamily: fontFamily,
        scaffoldBackgroundColor: UtanoColors.secondary,
        useMaterial3: true,
        inputDecorationTheme: inputDecorationTheme,
      );
}
