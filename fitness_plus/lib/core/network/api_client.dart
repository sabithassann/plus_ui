

import 'package:dio/dio.dart';
import 'package:fitness_plus/core/network/interceptor.dart';

class ApiClient {

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.0.230:8080/api",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  )..interceptors.add(AppInterceptor());
}