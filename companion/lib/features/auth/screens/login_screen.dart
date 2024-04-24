// ignore_for_file: must_be_immutable

import 'package:companion/core/components/app_button.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_assets.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:companion/core/resources/app_size.dart';
import 'package:companion/core/utils/navigator_utils.dart';
import 'package:companion/core/utils/utilities.dart';
import 'package:companion/features/auth/screens/registertion_layout.dart';
import 'package:companion/features/auth/widgets/registeration_item.dart';
import 'package:companion/features/auth/widgets/registeration_tff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _namecontroller = TextEditingController();

  final TextEditingController _passcontrollerr = TextEditingController();

  bool isVisiblepass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(64.h),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.neuro_spalsh_IC,
                      width: 75.w,
                      height: 75.h,
                    ),
                    Gap(32.h),
                    AppText(
                      "Sign In",
                      fontSize: 25.sp,
                      fontFamily: FontConstants.loraRegularFont,
                    ),
                  ],
                ),
              ),
              Gap(46.h),
              RegisterationTextFormField(
                controller: _namecontroller,
                Background: AppColors.logintffbgColor,
                borderColor: AppColors.logintffbgColor,
                borderRadius: 10.sp,
                hintTxt: "companion@gmail.com",
                type: TextInputType.emailAddress,
              ),
              Gap(15.h),
              RegisterationTextFormField(
                controller: _passcontrollerr,
                type: TextInputType.visiblePassword,
                borderColor: AppColors.logintffbgColor,
                hintTxt: "Min 8 characters",
                borderRadius: 10.sp,
                obscureText: isVisiblepass == true ? false : true,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisiblepass = !isVisiblepass;
                    });
                  },
                  icon: Icon(
                    isVisiblepass == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.hintColorRegisterTFFColor,
                  ),
                ),
              ),
              Gap(15.h),
              Align(
                alignment: Alignment.centerRight,
                child: AppText(
                  "Forgot your password?",
                  fontSize: 14.sp,
                  fontFamily: FontConstants.loraMediumFont,
                  color: AppColors.greyColor,
                ),
              ),
              Gap(300.h),
              Center(
                child: Column(
                  children: [
                    AppButton(
                      color: AppColors.authbtnbgColor,
                      titleColor: Colors.white,
                      width: 195.w,
                      height: 50.h,
                      title: "Sign In",
                      radius: 50.sp,
                      fontFamily: FontConstants.lorasemiBoldFont,
                      fontSize: FontSizes.small,
                      onTap: () {},
                    ),
                    Gap(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          "Do not have an account ?",
                          fontSize: 14.sp,
                          fontFamily: FontConstants.loraMediumFont,
                          color: AppColors.greyColor,
                        ),
                        Gap(10.w),
                        InkWell(
                          onTap: () {
                            pushScreen(
                                context, const RegisterationLayout());
                          },
                          child: AppText(
                            "Sign up",
                            fontSize: 14.sp,
                            fontFamily: FontConstants.loraMediumFont,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
