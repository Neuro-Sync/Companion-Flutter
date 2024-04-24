// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_size.dart';

class RegisterationTextFormField extends StatelessWidget {
  const RegisterationTextFormField(
      {super.key,
      this.Icon,
      this.controller,
      this.hintTxt,
      this.labelTxt,
      this.password,
      this.isEnabled,
      this.hintsize,
      this.cursorHeight,
      this.minliens,
      this.maxlines,
      this.readonly,
      this.focusNode,
      this.textAlignVertical,
      this.width,
      this.height,
      this.borderWidth,
      this.contentPadding,
      this.prefix,
      this.onChanged,
      this.type,
      this.validation,
      this.search,
      this.Background,
      this.labelColor,
      this.borderRadius,
      this.borderColor,
      this.textInputAction,
      this.obscureText,
      this.suffixIcon});
  final Widget? Icon;
  final TextEditingController? controller;
  final String? hintTxt;
  final String? labelTxt;
  final bool? password;
  final bool? isEnabled;
  final double? hintsize;
  final double? cursorHeight;
  final int? minliens;
  final int? maxlines;
  final bool? readonly;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final double? width;
  final double? height;
  final double? borderWidth;
  final double? contentPadding;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final TextInputType? type;
  final String? Function(String?)? validation;
  final Function(String?)? search;
  final Color? Background;
  final Color? labelColor;
  final double? borderRadius;
  final Color? borderColor;
  final bool? obscureText;

  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: width,
      decoration: BoxDecoration(
          color: Background ?? AppColors.logintffbgColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.sp)),
      child: Center(
        child: TextFormField(
            cursorColor: Colors.white,
            keyboardType: type,
            obscureText: obscureText ?? false,
            controller: controller,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onChanged: onChanged,
            style: TextStyle(
                color: AppColors.introBodyColor, fontSize: FontSizes.small),
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                hintText: hintTxt,
                prefixIcon: prefix,
                contentPadding:
                    EdgeInsets.only(left: 15.w, top: 15.h, bottom: 15.h),
                hintStyle: TextStyle(
                  fontSize: FontSizes.small,
                  color: AppColors.hintColorRegisterTFFColor,
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 0.7),
                    borderRadius: BorderRadius.circular(borderRadius ?? 10.sp)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            borderColor ?? AppColors.hintColorRegisterTFFColor,
                        width: 0.7),
                    borderRadius: BorderRadius.circular(borderRadius ?? 10.sp)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            borderColor ?? AppColors.hintColorRegisterTFFColor,
                        width: 0.7),
                    borderRadius: BorderRadius.circular(borderRadius ?? 10.sp)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 0.7),
                    borderRadius: BorderRadius.circular(borderRadius ?? 10.sp)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            borderColor ?? AppColors.hintColorRegisterTFFColor,
                        width: 0.7),
                    borderRadius:
                        BorderRadius.circular(borderRadius ?? 10.sp)))),
      ),
    );
  }
}
