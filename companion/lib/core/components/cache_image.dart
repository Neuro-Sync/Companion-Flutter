// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// import '../resources/app_colors.dart';
// import '../resources/app_font_family.dart';
// import 'app_text.dart';

// class CachImage extends StatelessWidget {
//   final double width;
//   final double higth;
//   final String imageUrl;
//   final double? redius;
//   final BoxFit? boxFit;
//   final Widget? errorWidget;
//   bool puturl ;

//   CachImage({
//     Key? key,
//     required this.imageUrl,
//     this.higth = 40,
//     this.boxFit,
//     this.errorWidget,
//     this.width = 40,
//     this.redius,
//     this.puturl = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//         borderRadius: BorderRadius.circular(redius ?? 100000),
//         child: CachedNetworkImage(
//             imageUrl:
//                 puturl == true ? EndPoints.baseUrlImage + imageUrl : imageUrl,
//             width: width,
//             height: higth,
//             fit: boxFit ?? BoxFit.fill,
//             progressIndicatorBuilder: (context, url, downloadProgress) =>
//                 Center(
//                   child: SizedBox(
//                       width: 20,
//                       height: 20,
//                       child: CircularProgressIndicator(
//                           value: downloadProgress.progress)),
//                 ),
//             errorWidget: (context, url, error) =>
//                 errorWidget ??
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     Icon(
//                       Icons.camera_alt,
//                       color: AppColors.white,
//                     ),
//                     AppText(
//                       "تعديل الصورة",
//                       color: AppColors.white,
//                       fontFamily: FontConstants.helveticaneuew23forskyrg,
//                       fontSize: 8.sp,
//                     ),
//                     AppText(
//                       "1500*500",
//                       color: AppColors.white,
//                       fontFamily: FontConstants.helveticaneuew23forskyrg,
//                       fontSize: 8.sp,
//                     ),
//                   ],
//                 )));
//   }
// }
