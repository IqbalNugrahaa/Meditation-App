import 'package:flutter/material.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/constants/app_strings.dart';
import 'package:metidation_app/core/constants/image_assets.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      body: Stack(
        children: [
          Image.asset(ImageAssets.frameSleep),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 56),
                AppText(
                  text: AppStrings.sleepStories,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColorWhite,
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: AppText(
                    text: AppStrings.sleepHeader,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textColorWhite,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
