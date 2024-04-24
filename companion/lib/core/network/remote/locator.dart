import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../local/local_data.dart';
import 'dio_consumer.dart';
import 'dio_interceptor.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  var prefInstance = await PrefService.getInstance();
  locator.registerSingleton<PrefService>(prefInstance);
  locator.registerLazySingleton(() => Dio());
  locator.registerSingleton<DioInterceptor>(DioInterceptor());
  //locator == dio()
  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton(() => DioConsumer(locator()));
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(Widget routeName) {
    return navigatorKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return routeName;
      },
    ), (route) => false);
  }
}
