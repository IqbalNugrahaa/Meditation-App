// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class SplashViewModel {
  void navigateToLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/auth');
    });
  }
}
