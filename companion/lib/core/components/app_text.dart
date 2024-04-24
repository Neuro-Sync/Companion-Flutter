import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../utils/locator_utils.dart';

class AppText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final TextDecoration? textDecoration;
  final Color? color;
  final Color? decorationColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  const AppText(
    this.text, {
    Key? key,
    this.textDecoration,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.height,
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.decorationColor,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          height: height,
          decoration: textDecoration,
          fontSize: fontSize,
          
          fontWeight: fontWeight,
          color: color ?? Colors.black,
          fontFamily: fontFamily),
      overflow: textOverflow,
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: LocatorUtils().pref().userLocal == "en"
          ? TextDirection.ltr
          : TextDirection.rtl,
    );
  }
}

  // style: GoogleFonts.cairo(
  //       color: color ?? AppUi.colors.subTitleColor,
  //       fontWeight: fontWeight,
  //       decoration: textDecoration ?? TextDecoration.none,
  //       decorationColor: decorationColor ?? AppUi.colors.subTitleColor,
  //       height: height ?? 1.2,
  //       fontSize: fontSize ?? 12.sp,
  //     ),
      