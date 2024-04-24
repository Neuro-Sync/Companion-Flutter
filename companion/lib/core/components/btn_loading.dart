// // ignore_for_file: non_constant_identifier_names, file_names
// import 'package:flutter/material.dart';
// import 'package:companion/core/components/lottie.dart';

// import 'package:sizer/sizer.dart';

// import '../resources/app_assets.dart';
// import '../resources/app_colors.dart';

// class LoadingCustomBtn extends StatelessWidget {
//   final Color? BackgroundColor;
//   final Color? txtColor;
//   final double? fontsize;
//   final Color? borderColor;
//   final String? path;
//   final double? height;
//   final double? widgth;
//   final double? lottieheight;
//   final double? lottiewidgth;
//    const LoadingCustomBtn({
//     Key? key,
//     this.BackgroundColor,
//     this.txtColor,
//     this.fontsize,
//     this.height,
//     this.lottieheight,
//     this.lottiewidgth,
//     this.widgth,
//     this.borderColor,
//     this.path,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widgth ?? double.infinity,
//       height: height ?? .06.h * 100,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           color: BackgroundColor ?? Colors.transparent,
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(
//               width: 1, color: borderColor ?? Colors.transparent)),

//       child: LottieFile(
//         path: path ?? AppAssets.btnloadingLogin,
//         higth: 35.sp,
//         width:35.sp ,
        
        
//       ),

//       // child: ,
//     );
//   }
// }
