import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:companion/core/app_cubit/app_cubit.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_size.dart';

class RegisterationAppBar extends StatelessWidget {
  const RegisterationAppBar({super.key, required this.currentScreen});
  final int currentScreen;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Row(
          children: [
            Gap(24.w),
            InkWell(
              onTap: () {
                switch (cubit.currentIndex) {
                  case 1:
                    cubit.changeCurrentregisterScreen(0);
                  case 2:
                    cubit.changeCurrentregisterScreen(1);

                  case 3:
                    cubit.changeCurrentregisterScreen(2);

                  case 4:
                    cubit.changeCurrentregisterScreen(3);

                  default:
                }
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            AppText(
              "Step ${currentScreen} of 6",
              color: Colors.black,
              fontSize: FontSizes.medium,
            ),
            Gap(24.w),
          ],
        );
      },
    );
  }
}
