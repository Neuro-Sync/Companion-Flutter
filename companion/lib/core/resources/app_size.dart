import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSize {
  static double getHeight(context) => MediaQuery.of(context).size.height;
  static double getwidth(context) => MediaQuery.of(context).size.width;
}

class FontSizes {
  static double veryLarge = 24.sp;
  static double large = 18.sp;
  static double medium = 16.sp;
  static double small = 14.sp;
  static double verySmall = 12.sp;
}
