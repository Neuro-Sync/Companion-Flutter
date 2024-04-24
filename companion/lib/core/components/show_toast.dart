import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/app_colors.dart';
import '../resources/app_font_family.dart';
import 'app_text.dart';

showToast(String text, BuildContext context, bool success) {
  FToast fToast = FToast();
  fToast.init(context);
  return fToast.showToast(
    child: Container(
      // width: 50.w,
      // height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: success ?Colors.green : Colors.red),
      child: AppText(
        text.toString(),
        color: Colors.white,
        // fontFamily: FontConstants.bigShouldersDisplayBold,
        textAlign: TextAlign.center,
      ),
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}
