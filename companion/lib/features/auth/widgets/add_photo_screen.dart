import 'dart:io';

import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_assets.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/resources/app_font_family.dart';
import 'package:companion/core/resources/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({super.key});

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  final ImagePicker _picker = ImagePicker();

  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(52.h),
          AppText(
            "Add Photo",
            color: AppColors.introBodyColor,
            fontSize: FontSizes.veryLarge,
            fontFamily: FontConstants.lorasemiBoldFont,
          ),
          Gap(8.h),
          AppText(
            "Add a photo so other companion know who you are.",
            color: Colors.black,
            fontSize: FontSizes.small,
            fontFamily: FontConstants.loraRegularFont,
          ),
          Gap(70.h),
          InkWell(
            onTap: () {
              _showDialog();
            },
            child: Container(
                height: 196.h,
                width: 198.w,
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(250.sp)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(profileImage != null ? 0 : 50.0.sp),
                  child: profileImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100000),
                          child: Image.file(
                            profileImage!,
                            height: 196.h,
                            width: 198.w,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Image.asset(
                          AppAssets.person_icon_IC,
                          width: 100.w,
                          height: 100.h,
                        ),
                )),
          ),
        ],
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Select"),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.photo_camera_rounded,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const AppText(
                              "Camera",
                              color: Colors.black,
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          _getImageFromCamera();
                        },
                      ),
                      GestureDetector(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.image,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            const AppText(
                              "Gallery",
                              color: Colors.black,
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          _getImageFromGallery();
                        },
                      )
                    ],
                  ),
                  Gap(
                    8.h,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: AppText(
                          "Cancel",
                          fontSize: FontSizes.small,
                          color: Colors.red,
                        )),
                  )
                ],
              ),
            ),
          );
        });
  }

  _getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        profileImage = File(pickedFile.path); //here is the image
      } else {
        print('No image selected.');
      }
    });
  }

  _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        profileImage = File(pickedFile.path); //image from gallery
      } else {
        print('No image selected.');
      }
    });
  }
}
