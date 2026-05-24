


import 'package:fitness_plus/features/admin/view/admin_home.dart';
import 'package:fitness_plus/features/auth/view/login_screen.dart';
import 'package:fitness_plus/features/user/view/user_home.dart';
import 'package:fitness_plus/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router(String? role) {
    return GoRouter(
      initialLocation: '/splash',
      routes: [
        GoRoute(path: '/splash', builder: (_, __) => SplashScreen()),
        GoRoute(path: '/login', builder: (_, __) => LoginScreen()),
        GoRoute(path: '/admin', builder: (_, __) => AdminHome()),
        GoRoute(path: '/user', builder: (_, __) => UserHome()),
      ],
        redirect: (_, state) {
          if (role == null) return '/login';

          if (role == "ROLE_MANAGER") return '/admin';
          if (role == "ROLE_TRAINER") return '/admin';
          if (role == "ROLE_USER") return '/user';

          return '/login';
        }
    );
  }
}