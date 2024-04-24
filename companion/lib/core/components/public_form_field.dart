// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, implementation_imports
// ignore: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart' as intl;
import 'package:easy_localization/src/public_ext.dart';

import '../resources/app_colors.dart';

class CustomTextFaild extends StatefulWidget {
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
  final Function(String)? onChanged;
  final TextInputType? type;
  final String? Function(String?)? validation;
  final Function(String?)? search;
  final Color? Background;
  final Color? labelColor;
  final double? borderRadius;
  final Color? borderColor;

  final TextInputAction? textInputAction;
  const CustomTextFaild(
      {Key? key,
      this.Icon,
      required this.controller,
      required this.hintTxt,
      this.password,
      this.labelTxt,
      this.cursorHeight,
      this.hintsize,
      this.minliens,
      this.isEnabled,
      this.borderColor,
      this.labelColor,
      this.focusNode,
      this.borderWidth,
      this.textAlignVertical,
      this.search,
      this.textInputAction,
      this.Background,
      this.type,
      this.onChanged,
      this.width,
      this.maxlines,
      this.readonly,
      this.contentPadding,
      this.prefix,
      this.validation,
      this.borderRadius,
      this.height})
      : super(key: key);

  @override
  State<CustomTextFaild> createState() => _CustomTextFaildState();
}

class _CustomTextFaildState extends State<CustomTextFaild> {
  String? lang;
  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  String? text;
  @override
  Widget build(BuildContext context) {
    lang = context.locale.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: widget.width ?? 90.w,
        height: widget.height,
        // height: 40,
        decoration: BoxDecoration(
            color: widget.Background ?? Colors.transparent,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 6),
            border: Border.all(
              color: widget.borderColor ?? Colors.grey,
              width: widget.borderWidth ?? .5,
            )),
        child: Center(
          child: TextFormField(
            enabled: widget.isEnabled ?? true,
            textAlignVertical:
                widget.textAlignVertical ?? TextAlignVertical.center,
            focusNode: widget.focusNode,
            cursorHeight: widget.cursorHeight ?? 3.5.h,
            cursorColor: AppColors.primarycolor,
            controller: widget.controller,
            obscureText: widget.password ?? false,
            minLines: widget.minliens ?? 1,
            maxLines: widget.maxlines ?? 1,
            textDirection: text == null && lang == "ar"
                ? TextDirection.rtl
                : text == null && lang == "en"
                    ? TextDirection.ltr
                    : isRTL(text ?? "")
                        ? TextDirection.rtl
                        : TextDirection.ltr,
            keyboardType: widget.type ?? TextInputType.text,
            validator: widget.validation,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            readOnly: widget.readonly ?? false,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            onFieldSubmitted: (txt) {
              if (widget.textInputAction == TextInputAction.search) {
                widget.search!(txt);
              }
            },
            onChanged: widget.onChanged ??
                (value) {
                  setState(() {
                    text = value;
                  });
                },
            style: TextStyle(
                fontSize: widget.hintsize ?? 12,
                color: Colors.black),
            decoration: InputDecoration(
                errorStyle: TextStyle(
                    fontFamily: FontConstants.loraMediumFont,
                    fontSize: 12,
                    color: Colors.red[900]),
                contentPadding: EdgeInsets.all(widget.contentPadding ?? 10),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: AppColors.primarycolor,
                      width: widget.borderWidth ?? .5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: Colors.black, width: widget.borderWidth ?? .5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: Colors.red, width: widget.borderWidth ?? .5),
                ),
                filled: true,
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontFamily: FontConstants.loraRegularFont,
                  fontSize: widget.hintsize ?? 10,
                ),
                hintText: widget.hintTxt ?? "",
                label: AppText(
                  widget.labelTxt ?? "",
                  fontFamily: FontConstants.loraRegularFont,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: widget.labelColor ?? AppColors.primarycolor,
                ),
                fillColor: Colors.white70,
                suffixIcon: widget.Icon,
                prefixIcon: widget.prefix),
          ),
        ),
      ),
    );
  }
}
