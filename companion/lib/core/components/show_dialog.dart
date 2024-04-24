import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: non_constant_identifier_names
Future<void> ShowDialog(context,
    {Widget? content,
    List<Widget>? actions,
    Widget? title,
    Color? titlecolor}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        child: AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
            titlePadding: EdgeInsets.only(
              left: 25.w,
              top: 1.h,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
            title: title ?? const Text(""),
            backgroundColor: Colors.white,
            elevation: 0.0,
            content: content,
            actions: actions),
      );
    },
  );
}
