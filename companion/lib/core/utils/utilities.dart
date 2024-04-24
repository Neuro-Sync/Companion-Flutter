// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/constants/constants.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';

import 'package:url_launcher/url_launcher.dart';

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERORR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

enum ToastStates {
  SUCCESS,
  ERORR,
  WARNING,
}

class AppUtil {
  static GlobalKey<NavigatorState>? navigatorKey;



  static appAlert(
    context, {
    String? title,
    String? msg,
    required ToastStates states,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.horizontal,
        padding: EdgeInsets.only(
            bottom: 10.h,
            right: kIsWeb && Constants.getwidth(context) > 800 ? 600 : 0,
            left: kIsWeb && Constants.getwidth(context) > 600 ? 500 : 0),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: Container(
            decoration: BoxDecoration(
              color: chooseToastColor(states),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(title ?? '',
                            fontSize: 3.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primarycolor),
                        SizedBox(
                          height: 1.h,
                        ),
                        AppText(
                          msg ?? '',
                          color: AppColors.primarycolor,
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                          fontSize: 15.sp,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ))));
  }

  static launchURL(String url) async {
    url = url;
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String getMessageTime(
      {required BuildContext context, required Timestamp time}) {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(time.millisecondsSinceEpoch)
            .toLocal();
    final formattedTime = DateFormat('hh:mm a').format(date);
    return formattedTime;
  }

  static bool isLtr(context) =>
      EasyLocalization.of(context)?.currentLocale == const Locale('en')
          ? true
          : false;

  static TextDirection textDirection(context) =>
      EasyLocalization.of(context)?.currentLocale == const Locale('en')
          ? TextDirection.LTR
          : TextDirection.LTR;

  static showSnackBar(context, String content, Color? bgcolor) {
    final snackBar = SnackBar(
      content: AppText(
        content,
        fontFamily: FontConstants.loraRegularFont,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: bgcolor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
    static void previewToast({
    required String msg,
    Toast? toastLength,
    Color? backgroundColor,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      fontSize: 10,
      webBgColor: "linear-gradient(to right, #191531, #26275B)",
      webShowClose: true,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }
}
