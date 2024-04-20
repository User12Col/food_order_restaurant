import 'package:flutter/material.dart';
import 'package:restaurant/theme/color.dart';

ThemeData themeData = ThemeData.light().copyWith(
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.appBarColor,
  ),
);