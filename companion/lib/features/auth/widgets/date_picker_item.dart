import 'package:companion/core/resources/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:companion/core/resources/app_size.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppAssets.register_second_IC,
            width: 390.w,
            height: 298.h,
          ),
          Gap(52.h),
          AppText(
            "What is your date of birth?",
            color: Colors.black,
            fontSize: FontSizes.veryLarge,
            fontFamily: FontConstants.loraBoldFont,
          ),
          Gap(8.h),
          AppText(
            "Don't worry, your date of birth will not appear in public",
            color: AppColors.introBodyColor,
            fontSize: FontSizes.small,
            fontFamily: FontConstants.loraMediumFont,
          ),
          Gap(70.h),
          Container(
            height: 55.h,
            width: 327.w,
            decoration: BoxDecoration(
               color: AppColors.logintffbgColor ,
              border: Border.all(
                color: AppColors.logintffbgColor,
                width: 0.7,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.sp)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 27),
                AppText(
                  selectedDate ?? "Enter your date of birth",
                  color: AppColors.hintColorRegisterTFFColor,
                  fontSize: FontSizes.small,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          selectedDate =
                              "${value.year}-${value.month}-${value.day}";
                        });
                      }
                    });
                  },
                  child: Icon(
                    Icons.calendar_month,
                    color: AppColors.hintColorRegisterTFFColor,
                  ),
                ),
                const SizedBox(width: 19),
              ],
            ),
          ),
        ],
      ),
    );
 
 
 
  }
}
