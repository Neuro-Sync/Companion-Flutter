import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:companion/core/resources/app_size.dart';
import 'package:companion/features/auth/widgets/registeration_tff.dart';

class RegisterationItem extends StatelessWidget {
  const RegisterationItem(
      {super.key,
      required this.title,
      required this.subtitle,
      this.controller,
      required this.hinttxt,
      this.type,
      this.suffixIcon,
      required this.image,
      this.ispass,
      this.confirmcontroller,
      this.hinttxtforPass,
      this.typeforpass});
  final String title;
  final String subtitle;
  final String hinttxt;
  final String? hinttxtforPass;
  final String image;
  final TextEditingController? controller;
  final TextEditingController? confirmcontroller;
  final TextInputType? type;
  final TextInputType? typeforpass;
  final Widget? suffixIcon;
  final bool? ispass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 390.w,
            height: 298.h,
          ),
          Gap(52.h),
          AppText(
            title.toString(),
            color: Colors.black,
            fontSize: FontSizes.veryLarge,
            fontFamily: FontConstants.loraBoldFont,
            fontWeight: FontWeight.bold,
          ),
          Gap(8.h),
          AppText(
            subtitle.toString(),
            fontSize: FontSizes.small,
            fontFamily: FontConstants.loraMediumFont,
            color: Colors.black,
          ),
          Gap(44.h),
          RegisterationTextFormField(
            controller: controller,
            hintTxt: hinttxt,
            type: type,
            suffixIcon: suffixIcon,
            width: AppSize.getwidth(context),
            borderColor: AppColors.logintffbgColor,
          ),
          Visibility(
            visible: ispass == true ? true : false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(24.h),
                RegisterationTextFormField(
                  controller: confirmcontroller,
                  hintTxt: hinttxtforPass,
                  type: typeforpass,
                  suffixIcon: suffixIcon,
                  borderColor: AppColors.logintffbgColor,
                  width: 343.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
