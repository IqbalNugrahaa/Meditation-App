import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/core/components/app_button.dart';
import 'package:metidation_app/core/components/app_seperator.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/constants/app_strings.dart';
import 'package:metidation_app/core/extensions/numbering_ext.dart';
import 'package:metidation_app/data/model/response/sleep/sleep_response.dart';

import '../../../core/components/app_text.dart';
import '../../../core/components/shimmer_placeholder.dart';
import '../../../core/constants/image_assets.dart';
import '../../../viewmodels/sleep/sleep_recommendation_view_model.dart';
import '../widgets/sleep_recommend_card.dart';

class RecommendDetailPage extends HookConsumerWidget {
  final Item data;
  const RecommendDetailPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepRecommendationViewModel = ref.read(
      sleepRecommendationViewModelProvider.notifier,
    );
    final sleepState = ref.watch(sleepRecommendationViewModelProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (sleepState.response == null &&
          !sleepState.isLoading &&
          sleepState.errorMessage == null) {
        sleepRecommendationViewModel.getSleeps();
      }
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blueColor,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 288.78,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      data.filename ?? "",
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        ImageAssets.brokenImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon:
                              Icon(Icons.favorite_border, color: Colors.black),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.download, color: Colors.black),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        AppText(
                          text: data.name ?? "-",
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColorWhite,
                        ),
                        SizedBox(height: 16.37),
                        AppText(
                          text: data.type ?? "-",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorGrey,
                        ),
                        SizedBox(height: 20),
                        AppText(
                          text: data.description ?? "-",
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: AppColors.textColorGrey,
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Icon(Icons.favorite,
                                color: AppColors.textColorPink),
                            SizedBox(width: 10.68),
                            AppText(
                              text:
                                  "${data.favorite?.format3Digit()} Favorites",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColorGrey,
                            ),
                            SizedBox(width: 16),
                            Icon(Icons.headphones,
                                color: AppColors.textColorBlue),
                            SizedBox(width: 4),
                            AppText(
                              text:
                                  "${data.listener?.format3Digit()} Listeners",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColorGrey,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.03),
                        AppSeparator(),
                        SizedBox(height: 30.17),
                        AppText(
                          text: AppStrings.related,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorWhite,
                        ),
                        SizedBox(height: 20.09),
                        SizedBox(
                          height: 380,
                          child: Builder(
                            builder: (_) {
                              if (sleepState.isLoading) {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                  ),
                                  itemCount: 4,
                                  itemBuilder: (context, i) =>
                                      ShimmerPlaceholder(
                                    height: 174.37,
                                    width: 177,
                                    borderRadius: 25,
                                  ),
                                );
                              } else if (sleepState.response != null) {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                  ),
                                  itemCount:
                                      sleepState.response!.items!.length >= 4
                                          ? 4
                                          : 0,
                                  itemBuilder: (context, i) {
                                    final data = sleepState.response?.items?[i];

                                    return SleepRecommendCard(
                                      imagePath: data?.filename ?? "",
                                      title: data?.name ?? "",
                                      time: data?.time ?? "",
                                      type: data?.type ?? "",
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
                        ),
                        SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: AppButton.contained(
                height: 63,
                text: AppStrings.play,
                borderRadius: 38,
                backgroundColor: AppColors.buttonColorPurple,
                onPressed: () {
                  context.pushNamed(
                    'music-player-sleep',
                    extra: data,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
