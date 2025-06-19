import 'package:flutter/widgets.dart';

class AuthViewModel {
  void navigateToSignUp(BuildContext context) {
    Navigator.pushNamed(context, '/signUp');
  }
}
