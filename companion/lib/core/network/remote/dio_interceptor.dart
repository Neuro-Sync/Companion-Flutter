// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';

import '../../utils/locator_utils.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers
      //X-Authorization
      ..["X-Authorization"] =
          'Bearer ${LocatorUtils().pref().userToken}'
      ..["Accept"] = "application/json"
      ..["Content-Type"] = "application/json"
      ..["X-localization"] = LocatorUtils().pref().userLocal;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
