import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_size.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final Function? onTap;
  final FontWeight? fontWeight;
  final String? title;
  final String? fontFamily;
  final Widget? titleWidget;
  final Color? color, titleColor, bordercolor;

  final double? width, height, fontSize, borderwidth;
  final BorderRadius? borderRadius;
final BoxBorder? border;
  final double? radius;
  const AppButton(
      {Key? key,
      this.onTap,
      this.fontFamily,
      this.color,
      this.titleColor,
      this.title,
      this.borderwidth,
      this.bordercolor,
      this.height,
      this.width,
      this.fontSize,
      this.borderRadius,
      this.titleWidget,
      this.border,
      this.fontWeight,
      this.radius})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: bordercolor ?? Colors.transparent,
            width: borderwidth ?? 0.2.h,
          ),
          borderRadius: BorderRadius.circular(radius ?? 30),
          color: color ?? AppColors.primarycolor,
        ),
        width: width ?? AppSize.getwidth(context),
        height: height ?? 6.h,
        child: Center(
            child: title == null
                ? titleWidget
                : AppText(
                    title!,
                    fontSize: fontSize ?? 12.sp,
                    fontWeight: fontWeight,
                    color: titleColor ??Colors.white,
                    fontFamily: fontFamily,
                  )),
      ),
    );
  }
}
