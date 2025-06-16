import 'package:flutter/material.dart';
import 'package:metidation_app/view/auth/auth_page.dart';
import 'package:metidation_app/view/splash/splash_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String auth = '/auth';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashPage(),
    auth: (context) => const AuthPage(),
  };
}
