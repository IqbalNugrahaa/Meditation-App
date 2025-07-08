import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/core/components/app_button.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/core/components/shimmer_placeholder.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/constants/app_strings.dart';
import 'package:metidation_app/core/constants/image_assets.dart';
import 'package:metidation_app/core/utils/media_query_util.dart';
import 'package:metidation_app/core/components/feature_card.dart';
import 'package:metidation_app/view/sleep/widgets/sleep_recommend_card.dart';
import 'package:metidation_app/viewmodels/sleep/sleep_recommendation_view_model.dart';

import '../../data/source/sleep_static_data.dart';
import '../../viewmodels/sleep/sleep_view_model.dart';

class SleepPage extends HookConsumerWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepViewModel = ref.read(sleepViewModelProvider.notifier);
    final sleepRecommendationViewModel = ref.read(
      sleepRecommendationViewModelProvider.notifier,
    );
    final isSelected = ref.watch(sleepViewModelProvider);
    final sleepState = ref.watch(sleepRecommendationViewModelProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (sleepState.response == null &&
          !sleepState.isLoading &&
          sleepState.errorMessage == null) {
        sleepRecommendationViewModel.getSleeps();
      }
    });

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
                SizedBox(height: 34.02),
                SizedBox(
                  height: 98,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: staticSleepList.length,
                    separatorBuilder: (context, i) => SizedBox(width: 20),
                    itemBuilder: (context, i) {
                      var data = staticSleepList[i];

                      return FeatureCard(
                        title: data.title,
                        icon: data.icon,
                        isSelected: isSelected == i,
                        onTap: () {
                          sleepViewModel.select(i);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: ScreenSize.width(context),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageAssets.oceanSleep,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.only(
                            top: 68.23,
                            bottom: 20.03,
                            left: 20,
                            right: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                text: AppStrings.oceanMoon,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textLightYellow,
                              ),
                              SizedBox(height: 5.01),
                              AppText(
                                text: AppStrings.descOcean,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: AppColors.textColorWhite,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 21.53),
                              AppButton.contained(
                                height: 35.06,
                                width: 70.2,
                                backgroundColor: Colors.white,
                                textColor: AppColors.textColorBlack,
                                borderRadius: 25,
                                text: AppStrings.start,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.2),
                        Builder(
                          builder: (_) {
                            if (sleepState.isLoading) {
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                ),
                                itemCount: 4,
                                itemBuilder: (context, i) => ShimmerPlaceholder(
                                  height: 174.37,
                                  width: 177,
                                  borderRadius: 25,
                                ),
                              );
                            } else if (sleepState.response != null) {
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                ),
                                itemCount:
                                    sleepState.response?.items?.length ?? 0,
                                itemBuilder: (context, i) {
                                  final data = sleepState.response?.items?[i];

                                  return GestureDetector(
                                    onTap: () {
                                      context.pushNamed(
                                        'detail-recommend',
                                        extra: data,
                                      );
                                    },
                                    child: SleepRecommendCard(
                                      imagePath: data?.filename ?? "",
                                      title: data?.name ?? "",
                                      time: data?.time ?? "",
                                      type: data?.type ?? "",
                                    ),
                                  );
                                },
                              );
                            } else if (sleepState.errorMessage != null) {
                              return Center(
                                child: AppText(
                                  text: sleepState.errorMessage ?? "-",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColorWhite,
                                ),
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
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
