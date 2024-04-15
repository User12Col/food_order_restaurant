import 'package:flutter/material.dart';
import 'package:restaurant/theme/color.dart';

ThemeData themeData = ThemeData(
  primaryColor: AppColors.primaryColor,
  indicatorColor: AppColors.primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.appBarColor,
    titleTextStyle: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    )
  )
);