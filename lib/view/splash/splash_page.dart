// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:metidation_app/core/constants/image_assets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metidation_app/viewmodels/splash/splash_view_model.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SplashViewModel();

    useEffect(() {
      viewModel.navigateToLogin(context);

      return null;
    }, []);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Center(child: Image.asset(ImageAssets.dayAuth)),
        ),
      ),
    );
  }
}
