import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:companion/core/resources/app_size.dart';
import 'package:companion/core/resources/app_texts.dart';

class OnBoardingThirdScreen extends StatelessWidget {
  const OnBoardingThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   AppAssets.onboarding_3_IC,
          //   width: 101,
          //   height: 207,
          // ),
          Gap(90.h),
          AppText(
            AppTexts.on_boarding_3_body,
            fontFamily: FontConstants.lorasemiBoldFont,
            fontSize: FontSizes.veryLarge,
            color: Colors.white,
          ),
          Gap(8.h),
          AppText(
            AppTexts.on_boarding_3_tail,
            fontFamily: FontConstants.lorasemiBoldFont,
            fontSize: FontSizes.medium,
            color: AppColors.introBodyColor,
          ),
        ],
      ),
    );
  }
}
