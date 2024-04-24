import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:companion/core/resources/app_assets.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/utils/locator_utils.dart';


class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  init(BuildContext context) {
    Timer(const Duration(seconds: 4), () => getdata(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      body: Container(
        color: AppColors.primarycolor,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.neuro_spalsh_IC,
                width: 200.w,
                height: 200.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  getdata(context) {
    if (LocatorUtils().pref().isLogin) {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     PageTransition(
      //         type: PageTransitionType.leftToRight,
      //         child: const DrawerScreen()),(Route<dynamic> route) => false,);
    } else {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     PageTransition(
      //         type: PageTransitionType.leftToRight, child: const Onboard()),(Route<dynamic> route) => false,);
    }
  }
}
