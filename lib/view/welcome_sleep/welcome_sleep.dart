// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/constants/app_strings.dart';
import 'package:metidation_app/core/constants/image_assets.dart';
import 'package:metidation_app/viewmodels/welcome_sleep/welcome_sleep_view_model.dart';

import '../../core/components/app_button.dart';

class WelcomeSleep extends HookConsumerWidget {
  const WelcomeSleep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(welcomeSleepViewModelProvider.notifier);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blueColor,
        body: Stack(
          children: [
            Image.asset(ImageAssets.sleepWelcome),
            Column(
              children: [
                SizedBox(height: 115),
                AppText(
                  text: AppStrings.welcomeSleep,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColorWhite,
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: AppText(
                    text: AppStrings.welcomeSleepHeader,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textColorWhite,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 67.78),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    ImageAssets.bird,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 80,
              left: 20,
              right: 20,
              child: AppButton.contained(
                height: 64,
                backgroundColor: AppColors.buttonColorPurple,
                textColor: AppColors.textColorWhite,
                text: AppStrings.getStarted,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                borderRadius: 38,
                onPressed: () async {
                  await viewModel.saveSleepSession();
                  context.push('/sleep');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
