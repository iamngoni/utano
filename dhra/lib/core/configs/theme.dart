/*
    @Project: hekima_patient
    @Date: 10, September, 2022
    @Author: Ngonidzashe Mangudya

    Copyright (c) 2022 ModestNerd
*/

import 'package:flutter/material.dart';

import 'configs.dart';

class AppTheme {
  final String fontFamily = "Poppins";
  final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      color: AppColors.light.withOpacity(0.8),
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    labelStyle: TextStyle(
      color: AppColors.light.withOpacity(0.8),
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.light,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.light.withOpacity(0.6),
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.light.withOpacity(0.6),
      ),
    ),
  );

  ThemeData get darkTheme => ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: fontFamily,
        backgroundColor: AppColors.background,
        useMaterial3: true,
        inputDecorationTheme: inputDecorationTheme,
      );

  ThemeData get lightTheme => ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: fontFamily,
        backgroundColor: AppColors.background,
        useMaterial3: true,
        inputDecorationTheme: inputDecorationTheme,
      );
}
