import 'package:go_router/go_router.dart';
import 'package:metidation_app/data/model/ui/course_ui_model.dart';
import 'package:metidation_app/view/auth/auth_page.dart';
import 'package:metidation_app/view/home/pages/course_detail_page.dart';
import 'package:metidation_app/view/login/login_page.dart';
import 'package:metidation_app/view/register/register_page.dart';
import 'package:metidation_app/view/reminder/reminder_page.dart';
import 'package:metidation_app/view/sleep/sleep_page.dart';
import 'package:metidation_app/view/splash/splash_page.dart';
import 'package:metidation_app/view/topic/topic_page.dart';
import 'package:metidation_app/view/welcome/welcome_page.dart';

import 'package:metidation_app/view/bottom_navigation/bottom_navigation_page.dart';
import 'package:metidation_app/view/home/home_page.dart';

import '../../view/not_found_page.dart';
import '../../view/welcome_sleep/welcome_sleep.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    // Routes di luar shell
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/welcome',
      name: 'welcome',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/topic',
      name: 'topic',
      builder: (context, state) => const TopicPage(),
    ),
    GoRoute(
      path: '/reminder',
      name: 'reminder',
      builder: (context, state) => const ReminderPage(),
    ),
    GoRoute(
      path: '/detail',
      name: 'detail',
      builder: (context, state) {
        final data = state.extra as CourseUiModel;
        return CourseDetailPage(data: data);
      },
    ),
    GoRoute(
      path: '/welcome-sleep',
      name: 'welcome-sleep',
      builder: (context, state) => const WelcomeSleep(),
    ),

    // ShellRoute untuk BottomNavigationPage
    ShellRoute(
      builder: (context, state, child) => BottomNavigationPage(child: child),
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/sleep',
          name: 'sleep',
          builder: (context, state) => const SleepPage(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const EmptyPage(),
);
