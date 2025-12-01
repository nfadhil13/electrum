import 'package:electrum/features/auth/presentation/pages/login/login_page.dart';
import 'package:electrum/features/auth/presentation/pages/register/register_page.dart';
import 'package:electrum/features/bike/presentation/pages/bike_detail/bike_detail_page.dart';
import 'package:electrum/features/home/presentation/pages/home/home_page.dart';
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
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.bikeDetails,
        builder: (context, state) {
          final bikeId = state.pathParameters['id'] ?? '';
          return BikeDetailPage(bikeId: bikeId);
        },
      ),
    ],
  );
}
