import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import 'api_consumer.dart';
import 'dio_interceptor.dart';
import 'locator.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio dio;
  DioConsumer(this.dio) {
    dio.options
      ..baseUrl = ""
      // EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < 500;
      };

    dio.interceptors.add(di.locator<DioInterceptor>());

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
    }
  }
  @override
  Future delete(
      {required String endpoint,
      FormData? formData,
      Map<String, dynamic>? query}) async {
    try {
      return json.decode(
          (await dio.delete(endpoint, data: formData, queryParameters: query))
              .toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future get({required String endpoint, Map<String, dynamic>? query}) async {
    try {
      return json
          .decode((await dio.get(endpoint, queryParameters: query)).toString());

      //decode  ---> map
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post(
      {required String endpoint,
      FormData? formData,
      Map<String, dynamic>? query}) async {
    try {
      return json.decode(
          (await dio.post(endpoint, data: formData, queryParameters: query))
              .toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future put(
      {required String endpoint,
      FormData? formData,
      Map<String, dynamic>? query}) async {
    try {
      return json.decode(
          (await dio.put(endpoint, data: formData, queryParameters: query))
              .toString());
    } catch (e) {
      rethrow;
    }
  }
}
