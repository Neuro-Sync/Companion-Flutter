import 'package:companion/core/components/app_button.dart';
import 'package:companion/core/utils/navigator_utils.dart';
import 'package:companion/features/home/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_assets.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:companion/core/resources/app_size.dart';
import 'package:companion/core/resources/app_texts.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(top: 30.h, right: 30.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: AppText(
                    "Skip",
                    color: AppColors.introBodyColor,
                    fontSize: 14.sp,
                    fontFamily: FontConstants.lorasemiBoldFont,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Gap(100.h),
            AppText(
              "Scan patient’s QR code",
              color: AppColors.introBodyColor,
              fontSize: 20.sp,
              fontFamily: FontConstants.lorasemiBoldFont,
              textAlign: TextAlign.center,
            ),
            Gap(40.h),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  AppAssets.qrcode_banner_IC,
                  width: 257.w,
                  height: 233.h,
                ),
                Image.asset(
                  AppAssets.qrcode_IC,
                  width: 200.w,
                  height: 190.h,
                ),
              ],
            ),
            Gap(170.h),
            AppButton(
              color: AppColors.authbtnbgColor,
              titleColor: Colors.white,
              width: 327.w,
              height: 50.h,
              title: "Scan QR Code",
              radius: 50.sp,
              fontFamily: FontConstants.lorasemiBoldFont,
              fontSize: FontSizes.small,
              onTap: () {
                pushReplacementScreen(context, const MapScreenForSelectLocation());
              },
            ),
          ],
        ),
      ),
    ));

    //qrcode_IC
  }
}
