import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:companion/core/resources/app_size.dart';

class RegisterationCodeItem extends StatelessWidget {
  const RegisterationCodeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "Enter the 6 digit code",
            color: Colors.white,
            fontSize: FontSizes.veryLarge,
            fontFamily: FontConstants.loraBoldFont,
          ),
          Gap(8.h),
          AppText(
            "The otp code will be sent to email   sa **** **** *@gmail.com",
            color: AppColors.introBodyColor,
            fontSize: FontSizes.small,
          ),
          Gap(44.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
                6,
                (index) => Expanded(
                      child: _textFieldOTP(context,
                          first: index == 0 ? true : false,
                          last: index == 5 ? true : false,
                          controller: TextEditingController()),
                    )),
          ),
          Gap(12.h),
          Row(
            children: [
              AppText(
                "Resend code",
                color: AppColors.hintColorRegisterTFFColor,
                fontSize: FontSizes.small,
                fontFamily: FontConstants.loraMediumFont,
              ),
              Gap(8.h),
              AppText(
                "57sec",
                color: AppColors.introBodyColor,
                fontSize: FontSizes.small,
                fontFamily: FontConstants.loraRegularFont,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textFieldOTP(context, {bool? first, last, controller}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.5.w),
      child: SizedBox(
        height: 85,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: TextField(
            autofocus: true,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.hintColorRegisterTFFColor),
            keyboardType: TextInputType.number,
            maxLength: 1,
            controller: controller,
            decoration: InputDecoration(
              counter: const Offstage(), //clear counter of max length
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.black12),
                  borderRadius: BorderRadius.circular(8.sp)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(8.sp)),
            ),
          ),
        ),
      ),
    );
  }
}
