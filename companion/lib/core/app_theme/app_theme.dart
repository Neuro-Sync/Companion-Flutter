import 'package:flutter/material.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:companion/core/resources/app_size.dart';

class CustomTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: false,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.primarycolor,
    primaryColorLight: AppColors.primarycolor,
    primaryColorDark: AppColors.primarycolor,
    scaffoldBackgroundColor: AppColors.primarycolor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: AppColors.primarycolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 12,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(2.5),
        ),
      ),
    ),
    fontFamily: FontConstants.loraMediumFont,
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontSize: FontSizes.large,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      titleLarge: TextStyle(fontSize: FontSizes.large, color: Colors.white),
      bodyMedium: TextStyle(
          fontSize: FontSizes.medium,
          fontFamily: FontConstants.loraRegularFont,
          color: Colors.white),
      headlineMedium: TextStyle(
        fontSize: FontSizes.medium,
        fontFamily: FontConstants.loraRegularFont,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(fontSize: FontSizes.large, color: Colors.white),
    ),
    indicatorColor: Colors.white,
    hoverColor: AppColors.primarycolor,
    splashColor: AppColors.primarycolor,
  );
}
