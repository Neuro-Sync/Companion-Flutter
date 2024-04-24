// ignore_for_file: library_private_types_in_public_api

import 'package:companion/core/resources/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:companion/core/resources/app_size.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectedGender;
  TextEditingController customGenderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                AppAssets.woman_IC,
                width: 112.w,
                height: 135.h,
              ),
              Gap(84.w),
              Image.asset(
                AppAssets.person_IC,
                width: 112.w,
                height: 135.h,
              ),
            ],
          ),
          Gap(76.h),
          AppText(
            "What’s Your gender?",
            color: Colors.black,
            fontSize: FontSizes.veryLarge,
            fontFamily: FontConstants.loraBoldFont,
          ),
          Gap(8.h),
          AppText(
            "we respect and celebrate diversity. Please choose the gender",
            color: Colors.black,
            fontSize: FontSizes.small,
            fontFamily: FontConstants.loraMediumFont,
          ),
          Gap(70.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                    height: 84.h,
                    decoration: BoxDecoration(
                        color: AppColors.femalebgColor,
                        borderRadius: BorderRadius.circular(15.sp)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.female_IC,
                            width: 55.w,
                            height: 55.h,
                          ),
                          Gap(12.w),
                          const AppText(
                            "Female",
                            fontFamily: FontConstants.lorasemiBoldFont,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )),
              ),
              Gap(8.w),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.malebgColor,
                        borderRadius: BorderRadius.circular(15.sp)),
                    height: 84.h,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.male_IC,
                            width: 55.w,
                            height: 55.h,
                          ),
                          Gap(12.w),
                          const AppText(
                            "Male",
                            fontFamily: FontConstants.lorasemiBoldFont,
                            color: Colors.black,
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    customGenderController.dispose();
    super.dispose();
  }
}
