

import 'package:fitness_plus/features/auth/viewmodel/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {

  LoginScreen({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login Screen", style: TextStyle(fontSize: 22)),

            const SizedBox(height: 20),

            // ✅ Username field
            TextField(
              controller: username,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // ✅ Password field
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 Test Button (Optional)
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).state = "ROLE_MANAGER";
                context.go('/admin');
              },
              child: const Text("Login as Admin (Test)"),
            ),

            const SizedBox(height: 10),

            // 🔥 Real API Login
            ElevatedButton(
              onPressed: () async {
                await ref.read(authProvider.notifier).login(
                  username.text.trim(),
                  password.text.trim(),
                );

                final role = ref.read(authProvider);

                if (role == "ROLE_MANAGER" || role == "ROLE_TRAINER") {
                  context.go('/admin');
                } else {
                  context.go('/user');
                }
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}