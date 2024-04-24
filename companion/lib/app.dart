// ignore_for_file: use_build_context_synchronously

import 'package:companion/core/utils/locator_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:companion/core/app_theme/app_theme.dart';

import 'package:companion/core/network/remote/locator.dart';
import 'package:companion/core/validators/bloc_providers.dart';
import 'package:companion/features/intro/screens/on_boarding_layout.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key, this.remoteMessage}) : super(key: key);
  final RemoteMessage? remoteMessage;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String lang;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    lang = context.locale.toString();
    LocatorUtils().pref().userLocal = lang;
    return MultiBlocProvider(
        providers: BlocProviders.providers(context),
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            useInheritedMediaQuery: true,
            builder: (context, child) {
              return MaterialApp(
                theme: CustomTheme.themeData,

                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                navigatorKey: locator<NavigationService>().navigatorKey,
                // onGenerateRoute: RouterGenarator.generateRoute,
                home:  OnboardingLayout(),
              );
            }));
  }
}
