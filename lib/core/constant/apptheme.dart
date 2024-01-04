import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

ThemeData themeArabic = ThemeData(
  scaffoldBackgroundColor: AppColor.secondColor,
  fontFamily: "Cairo",
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    centerTitle: true,
  ),
  // useMaterial3: true,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      height: 2,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 13.0,
      height: 0.0,
      fontWeight: FontWeight.bold,
      color: AppColor.colorGrey,
    ),
    bodyMedium: TextStyle(
      color: AppColor.colorGrey,
    ),
  ),
);

ThemeData themeEnglishAndFrench = ThemeData(
  scaffoldBackgroundColor: AppColor.secondColor,
  fontFamily: "Playfair",
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
  // useMaterial3: true,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      height: 2,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      // fontSize: 10.0,
      height: 0.0,
      fontWeight: FontWeight.bold,
      color: AppColor.colorGrey,
    ),
    bodyMedium: TextStyle(
      color: AppColor.colorGrey,
    ),
  ),
);
