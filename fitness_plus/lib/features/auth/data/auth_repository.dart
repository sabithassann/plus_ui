


import 'package:fitness_plus/core/network/api_client.dart';
import 'package:fitness_plus/core/storage/token_storage.dart';
import 'package:fitness_plus/features/auth/model/auth_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository {
  final storage = TokenStorage();

  Future<AuthResponse> login(String username, String password) async {
    final res = await ApiClient.dio.post(
      "/auth/signin",
      data: {
        "username": username,
        "password": password,
      },
    );

    final data = AuthResponse.fromJson(res.data);

    // save token
    await storage.saveToken(data.token);

    return data;
  }
}