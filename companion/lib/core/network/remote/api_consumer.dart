import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get({required String endpoint, Map<String, dynamic> query});
  Future<dynamic> post(
      {required String endpoint,
      FormData formData,
      Map<String, dynamic> query});

  Future<dynamic> delete(
      {required String endpoint,
      FormData formData,
      Map<String, dynamic> query});
  Future<dynamic> put(
      {required String endpoint,
      FormData formData,
      Map<String, dynamic> query});
}


/// required String url,
  