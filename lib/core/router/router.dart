import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';

class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.landing,
        builder: (context, state) => const SizedBox(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const SizedBox(),
      ),
    ],
  );
}
