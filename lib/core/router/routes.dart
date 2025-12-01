part of 'router.dart';

class AppRoutes {
  const AppRoutes._();

  static const String landing = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String bikeDetails = '/bike/:id';
  static const String bikeInterestForm = '/bike/:id/interest-form';
}

extension AppRoutesX on String {
  String withParameter(String key, String value) => replaceAll(':$key', value);
}
