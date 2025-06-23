import 'package:flutter/material.dart';
import 'package:metidation_app/view/auth/auth_page.dart';
import 'package:metidation_app/view/splash/splash_page.dart';

import '../../view/login/login_page.dart';
import '../../view/register/register_page.dart';
import '../../view/topic/topic_page.dart';
import '../../view/welcome/welcome_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String auth = '/auth';
  static const String register = '/register';
  static const String login = '/login';
  static const String welcome = '/welcome';
  static const String topic = '/topic';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashPage(),
    auth: (context) => const AuthPage(),
    register: (context) => const RegisterPage(),
    login: (context) => const LoginPage(),
    welcome: (context) => const WelcomePage(),
    topic: (context) => const TopicPage(),
  };
}
