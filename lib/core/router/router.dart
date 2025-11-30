import 'package:electrum/features/auth/presentation/pages/login/login_page.dart';
import 'package:electrum/features/auth/presentation/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';

class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.landing,
        builder: (context, state) => const SizedBox(),
      ),
      GoRoute(path: AppRoutes.login, builder: (context, state) => LoginPage()),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => RegisterPage(),
      ),
    ],
  );
}
