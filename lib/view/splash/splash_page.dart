// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metidation_app/core/constants/image_assets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metidation_app/core/helpers/session_manager.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () async {
        final hasSession = await SessionManager.hasSession();
        final hasTopic = await SessionManager.hasTopic();
        if (hasSession) {
          if (hasTopic) {
            context.go('/home');
          } else {
            context.go('/welcome');
          }
        } else {
          context.go('/auth');
        }
      });

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
