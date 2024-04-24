import 'package:flutter/material.dart';

class AppSize {
  static double getHeight(context) => MediaQuery.of(context).size.height;
  static double getwidth(context) => MediaQuery.of(context).size.width;
}
