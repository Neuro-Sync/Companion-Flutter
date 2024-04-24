// // ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, implementation_imports, depend_on_referenced_packages, must_be_immutable, prefer_interpolation_to_compose_strings, use_super_parameters
// // ignore: prefer_const_literals_to_create_immutables
// import 'package:flutter/material.dart';
// import 'package:companion/core/components/app_text.dart';
// import 'package:sizer/sizer.dart';

// import 'package:intl/intl.dart' as intl;
// import 'package:easy_localization/src/public_ext.dart';

// import '../resources/app_colors.dart';
// import '../resources/app_font_family.dart';
// import '../utils/locator_utils.dart';

// class CustomTextField extends StatefulWidget {
//   final Widget? Icon;
//   final TextEditingController? controller;
//   final String? hintTxt;
//   final String? labelTxt;
//   final double? hintsize;
//   final double? radius;
//   final int? minliens;
//   final int? maxlines;
//   final int? maxlength;
//   final bool? readonly;
//   final bool? visible;
//   final Widget? prefix;
//   final TextInputType? type;
//   final String? Function(String?)? validation;
//   final Function(String?)? search;
//   final Color? Background;
//   final Color? contentColor;
//   final Color? outlineBorderColor;
//   final Color? hintColor;
//   final Color? labelColor;
//   final Color? boderColor;
//   final Color? cursorColor;
//   final double? borderThickness;
//   final double? contentPaddingVertical;
//   final double? contentPaddinghorizental;
//   final double? width;
//   final double? cursorHeight;
//   final double? height;
//   final TextAlignVertical? textAlignVertical;
//   void Function(String)? onChanged;
//   String? initialvalue;
//   final List<BoxShadow>? boxShadow;
//   final EdgeInsetsGeometry? padding;
//   bool? enablevalidation = true;
//   bool? isenabled = true;

//   final TextInputAction? textInputAction;
//   CustomTextField(
//       {Key? key,
//       this.Icon,
//       this.controller,
//       this.cursorColor,
//       this.labelColor,
//       this.maxlength,
//       this.initialvalue,
//       this.hintTxt,
//       this.visible,
//       this.width,
//       this.labelTxt,
//       this.maxlines,
//       this.cursorHeight,
//       this.height,
//       this.contentColor,
//       this.borderThickness,
//       this.outlineBorderColor,
//       this.hintsize,
//       this.boderColor,
//       this.contentPaddingVertical,
//       this.contentPaddinghorizental,
//       this.hintColor,
//       this.minliens,
//       this.search,
//       this.textInputAction,
//       this.Background,
//       this.isenabled,
//       this.textAlignVertical,
//       this.type,
//       this.padding,
//       this.readonly,
//       this.radius,
//       this.prefix,
//       this.onChanged,
//       this.boxShadow,
//       this.enablevalidation,
//       this.validation})
//       : super(key: key);

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   String? lang;
//   bool isRTL(String text) {
//     return intl.Bidi.detectRtlDirectionality(text);
//   }

//   String? text;

//   @override
//   Widget build(BuildContext context) {
//     lang = context.locale.toString();
//     return Padding(
//       padding: widget.padding ?? EdgeInsets.all(0.5.w),
//       child: SizedBox(
//         width: widget.width ?? .9.w * 100,
//         // height: widget.height ?? 10.h,
//         child: Center(
//           child: TextFormField(
//             maxLength: widget.maxlength,
//             textAlignVertical: widget.textAlignVertical,
//             textAlign: TextAlign.start,
//             enabled: widget.isenabled ?? true,
//             showCursor: true,
//             cursorColor: widget.cursorColor == null
//                 ? widget.cursorColor
//                 : AppColors.primarycolor,
//             cursorHeight: widget.cursorHeight ?? 3.5.h,
//             controller: widget.controller,
//             obscureText: widget.visible ?? false,
//             minLines: widget. minliens ,
//             maxLines:widget.maxlines,
//             textDirection: text == null && lang == "ar"
//                 ? TextDirection.rtl
//                 : text == null && lang == "en"
//                     ? TextDirection.ltr
//                     : isRTL(text ?? "")
//                         ? TextDirection.rtl
//                         : TextDirection.ltr,
//             keyboardType: widget.type ?? TextInputType.text,
//             validator: widget.enablevalidation == true
//                 ? widget.validation ??
//                     (value) {
//                       if (value!.isEmpty) {
//                         return "this field is rquired";
//                       }
//                       return null;
//                     }
//                 : (value) {},
//               autovalidateMode: AutovalidateMode.onUserInteraction, //يجاهل
//             readOnly: widget.readonly ?? false,
//             textInputAction: widget.textInputAction ?? TextInputAction.next,
//             onFieldSubmitted: (txt) {
//               if (widget.textInputAction == TextInputAction.search) {
//                 widget.search!(txt);
//               }
//             },
//             onChanged: widget.onChanged,
//             style: TextStyle(
//               fontFamily: FontConstants.helveticaneuew23forskyrg,
//               fontSize: widget.hintsize ?? 12.sp,
//               color: widget.contentColor ?? Colors.black,
//             ),
//             decoration: InputDecoration(
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 alignLabelWithHint: true,
//                 contentPadding: EdgeInsets.symmetric(
//                     vertical: widget.contentPaddingVertical ?? 2.3.h,
//                     horizontal: widget.contentPaddinghorizental ?? 2.w),
//                 errorStyle: TextStyle(
//                     fontFamily: FontConstants.helveticaneuew23forskyrg,
//                     fontSize: 10.sp,
//                     color: Colors.red[900]),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(widget.radius ?? 30),
//                   borderSide: BorderSide(
//                       color: widget.outlineBorderColor ?? AppColors.white,
//                       width: widget.borderThickness ?? .5),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(widget.radius ?? 30),
//                   borderSide: BorderSide(
//                     color: widget.outlineBorderColor ?? AppColors.white,
//                     width: widget.borderThickness ?? .2,
//                   ),
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(widget.radius ?? 30),
//                   borderSide: BorderSide(
//                     color: Colors.red,
//                     width: widget.borderThickness ?? .2,
//                   ),
//                 ),
//                 disabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(widget.radius ?? 30),
//                   borderSide: BorderSide(
//                     color: Colors.transparent,
//                     width: widget.borderThickness ?? .2,
//                   ),
//                 ),
//                 filled: true,
//                 hintStyle: TextStyle(
//                   color: widget.hintColor ?? AppColors.addpostfirstcolor,
//                   fontFamily: FontConstants.helveticaneuew23forskyrg,
//                   fontSize: widget.hintsize ?? 12.sp,
//                 ),
//                 hintText: widget.hintTxt != null
//                     ? "   " + widget.hintTxt.toString() + "   "
//                     : "",
//                 hintTextDirection: LocatorUtils().pref().userLocal == "ar"
//                     ? TextDirection.rtl
//                     : TextDirection.ltr,
//                 label: AppText(
//                   widget.labelTxt ?? "",
//                   textAlign: TextAlign.center,
//                   fontSize: widget.hintsize ?? 12.sp,
//                   color: widget.labelColor,
//                 ),
//                 fillColor: widget.Background,
//                 suffixIcon: widget.Icon,
//                 prefixIcon: widget.prefix),
//           ),
//         ),
//       ),
//     );
//   }
// }
