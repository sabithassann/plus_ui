

import 'package:dio/dio.dart';
import 'package:fitness_plus/core/storage/token_storage.dart';

class AppInterceptor extends Interceptor {
  final TokenStorage storage = TokenStorage();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.getToken();

    if (token != null && token.isNotEmpty) {
      // ✅ Authorization header attach
      options.headers["Authorization"] = "Bearer $token";
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      print("Unauthorized - Token expired");
    }

    handler.next(err);
  }
}