// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:companion/core/utils/navigator_utils.dart';
import 'package:companion/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:companion/core/resources/app_assets.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_size.dart';
import 'package:companion/core/resources/app_texts.dart';
import 'package:companion/features/intro/widgets/onboarding_item.dart';

class OnboardingLayout extends StatelessWidget {
  OnboardingLayout({super.key});

  List<String> titles = [
    AppTexts.on_boarding_1_body,
    AppTexts.on_boarding_2_body,
    AppTexts.on_boarding_3_body,
  ];

  List<String> bodeis = [
    AppTexts.on_boarding_1_tail,
    AppTexts.on_boarding_2_tail,
    AppTexts.on_boarding_3_tail,
  ];

  List<String> bgImages = [
    AppAssets.onboarding_1_IC,
    AppAssets.onboarding_2_IC,
    AppAssets.onboarding_3_IC,
  ];

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
        finishButtonText: 'Login',
        finishButtonTextStyle: TextStyle(fontSize: FontSizes.medium),
        finishButtonStyle: FinishButtonStyle(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.sp)))),
        onFinish: () {
          pushScreen(context, LoginScreen());
        },
        trailing: Text(
          'skip',
          style: TextStyle(
            fontSize: FontSizes.medium,
            color: AppColors.introBodyColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        addController: true,
        hasSkip: true,
        centerBackground: true,
        skipTextButton: Text(
          'skip',
          style: TextStyle(
            fontSize: FontSizes.small,
            color: AppColors.introBodyColor,
          ),
        ),
        hasFloatingButton: true,
        imageVerticalOffset: 50.h,
        trailingFunction: () {
          pushScreen(context, LoginScreen());
        },
        addButton: true,
        skipFunctionOverride: () {
          pushScreen(context, LoginScreen());
        },
        controllerColor: AppColors.introBodyColor,
        totalPage: 3,
        headerBackgroundColor: AppColors.primarycolor,
        background: List.generate(
            3,
            (index) => Padding(
                  padding: EdgeInsets.only(top: index == 3 ? 100.h : 0.h),
                  child: Image.asset(
                    bgImages[index],
                    width: 390.w,
                    height: 298.h,
                  ),
                )),
        speed: 1.8,
        pageBodies: List.generate(
          3,
          (index) => OnboardingBody(
              title: titles[index], body: bodeis[index], gapHeight: 16.h),
        ));
  }
}
