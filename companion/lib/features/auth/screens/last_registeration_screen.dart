import 'package:companion/core/resources/app_assets.dart';
import 'package:companion/core/utils/navigator_utils.dart';
import 'package:companion/features/intro/screens/qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:companion/core/components/app_button.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:companion/core/resources/app_size.dart';

class RegisterationCongratulationsScreen extends StatelessWidget {
  const RegisterationCongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(84.h),
          Image.asset(
            AppAssets.last_registeration_image_IC,
            width: 324.w,
            height: 374.h,
          ),
                    Gap(55.h),

          AppText(
            "Woohoo!",
            color: Colors.black,
            fontSize: 40.sp,
            fontFamily: FontConstants.loraBoldFont,
          ),
          Gap(12.h),
          Center(
            child: SizedBox(
              width: 342.w,
              child: AppText(
                "Registration complete! Get ready to have the best experiences of your life.",
            color: Colors.black,
                fontSize: FontSizes.medium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Gap(110.h),
          AppButton(
            color: AppColors.authbtnbgColor,
            titleColor: Colors.white,
            width: 327.w,
            height: 50.h,
            title: "Let start!",
                    radius: 50.sp,
            fontFamily: FontConstants.lorasemiBoldFont,
            fontSize: FontSizes.small,
            onTap: () {
              pushReplacementScreen(context, const QrCodeScreen());
            },
          ),
        ],
      ),
    );
  }
}
