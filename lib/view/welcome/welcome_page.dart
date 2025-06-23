import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/core/components/app_button.dart';
import 'package:metidation_app/core/components/shimmer_placeholder.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/constants/image_assets.dart';
import 'package:metidation_app/viewmodels/welcome/welcome_view_model.dart';

import '../../core/components/app_text.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/icon_assets.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(welcomeViewModelProvider);
    final viewModel = ref.read(welcomeViewModelProvider.notifier);

    // Jalankan getUserById() saat pertama kali build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.response == null &&
          !state.isLoading &&
          state.errorMessage == null) {
        viewModel.getUserById();
      }
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                ImageAssets.welcome,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      AppText(
                        text: "Silent",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColorWhite,
                      ),
                      SvgPicture.asset(IconAssets.logoBlue),
                      AppText(
                        text: "Moon",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColorWhite,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 75),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48),
                  child: Builder(
                    builder: (_) {
                      if (state.isLoading) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: ShimmerPlaceholder(
                                height: 41.5,
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: ShimmerPlaceholder(
                                height: 41.5,
                              ),
                            ),
                            SizedBox(height: 15),
                            ShimmerPlaceholder(
                              height: 48,
                            ),
                          ],
                        );
                      } else if (state.errorMessage != null) {
                        return AppText(
                          text: state.errorMessage!,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        );
                      } else if (state.response != null) {
                        var data = state.response;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              text: 'Hi ${data?.firstName}, Welcome',
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textColorWhite,
                              textAlign: TextAlign.center,
                            ),
                            AppText(
                              text: AppStrings.toSilentMoon,
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColorWhite,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 15),
                            AppText(
                              text: AppStrings.welcomeHeader,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: AppColors.textColorWhite,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 100,
              left: 22,
              right: 22,
              child: AppButton.contained(
                backgroundColor: AppColors.buttonColorGrey,
                textColor: AppColors.textColorBlack,
                text: AppStrings.getStarted,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                borderRadius: 38,
                onPressed: () {
                  Navigator.pushNamed(context, '/topic');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
