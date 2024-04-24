import 'package:flutter/material.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterNumItem extends StatefulWidget {
  const EnterNumItem(
      {super.key,
      required this.first,
      required this.controller,
      required this.last});
  final bool first;
  final bool last;
  final TextEditingController controller;
  @override
  State<EnterNumItem> createState() => _EnterNumItemState();
}

class _EnterNumItemState extends State<EnterNumItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 1.w),
      child: SizedBox(
        height: 6.h,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: TextField(
            autofocus: true,
            onChanged: (value) {

              if (value.length == 1 && widget.last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && widget.first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            maxLength: 3,
            controller: widget.controller,
            decoration: InputDecoration(
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.black12),
                  borderRadius: BorderRadius.circular(6.sp)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: AppColors.primarycolor),
                  borderRadius: BorderRadius.circular(8.sp)),
            ),
          ),
        ),
      ),
    );
  }
}
