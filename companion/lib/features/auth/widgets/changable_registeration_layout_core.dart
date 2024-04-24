import 'package:companion/core/resources/app_assets.dart';
import 'package:companion/core/utils/navigator_utils.dart';
import 'package:companion/features/auth/screens/last_registeration_screen.dart';
import 'package:companion/features/auth/widgets/add_photo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:companion/core/app_cubit/app_cubit.dart';
import 'package:companion/features/auth/widgets/date_picker_item.dart';
import 'package:companion/features/auth/widgets/gender_dropdown_menu.dart';
import 'package:companion/features/auth/widgets/registeration_code_item.dart';
import 'package:companion/features/auth/widgets/registeration_item.dart';

class ChangableRegisterationCore extends StatelessWidget {
  ChangableRegisterationCore({super.key});
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController confirmpasscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        switch (cubit.currentIndex) {
          case 0:
            return RegisterationItem(
              image: AppAssets.register_one_IC,
              controller: namecontroller,
              hinttxt: "Enter your full name....",
              subtitle: "Enter your name so that it is easily recognized",
              title: "What’s Your Name?",
              type: TextInputType.name,
            );
          case 1:
            return const DatePicker();

          case 2:
            return RegisterationItem(
              image: AppAssets.register_third_IC,
              controller: emailcontroller,
              hinttxt: "Enter your Email...",
              title: "Enter your email",
              subtitle: "Enter your email so that it is easily send code ",
              type: TextInputType.emailAddress,
            );
          case 3:
            return RegisterationItem(
              image: AppAssets.register_one_IC,
              controller: passcontroller,
              hinttxt: "Enter your password...",
              hinttxtforPass: "Confirm password...",
              subtitle: "Please enter your password.",
              title: "Enter your password",
              type: TextInputType.visiblePassword,
              ispass: true,
              confirmcontroller: confirmpasscontroller,
            );
          case 4:
            return const GenderSelection();
          case 5:
            return const AddPhotoScreen();


          default:
        }
        return const Placeholder();
      },
    );
  }
}
