


import 'package:fitness_plus/features/auth/data/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
StateNotifierProvider<AuthNotifier, String?>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<String?> {
  AuthNotifier() : super(null);

  final repo = AuthRepository();

  Future<void> login(String u, String p) async {
    final res = await repo.login(u, p);

    state = res.roles.isNotEmpty ? res.roles[0] : null;
  }

  void logout() {
    state = null;
  }
}