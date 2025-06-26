import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/core/constants/image_assets.dart';
import 'package:metidation_app/core/utils/media_query_util.dart';
import 'package:metidation_app/data/source/course_static_data.dart';
import 'package:metidation_app/data/source/recommend_static_data.dart';
import 'package:metidation_app/view/home/widgets/course_card.dart';
import 'package:metidation_app/viewmodels/home/home_view_model.dart';

import '../../core/components/app_text.dart';
import '../../core/components/shimmer_placeholder.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/icon_assets.dart';
import '../../viewmodels/home/greeting_view_model.dart';
import 'utils/course_card_util.dart';
import 'utils/recommend_card_util.dart';
import 'widgets/recommend_card.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);
    final greeting = ref.watch(greetingViewModelProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.response == null &&
          !state.isLoading &&
          state.errorMessage == null) {
        viewModel.getUserById();
      }
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                AppText(
                  text: AppStrings.appName.split(" ")[0],
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColorBlack,
                ),
                SvgPicture.asset(IconAssets.logo),
                AppText(
                  text: AppStrings.appName.split(" ")[1],
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColorBlack,
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(
                    builder: (_) {
                      if (state.isLoading) {
                        return ShimmerPlaceholder(
                          width: ScreenSize.width60(context),
                          height: 30,
                        );
                      } else if (state.errorMessage != null) {
                        return AppText(
                          text: "-",
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColorBlack,
                          textAlign: TextAlign.start,
                        );
                      } else if (state.response != null) {
                        var data = state.response;

                        return AppText(
                          text: '$greeting, ${data?.firstName}',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColorBlack,
                          textAlign: TextAlign.start,
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                  AppText(
                    text: AppStrings.homeGreeting,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textColorGrey,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 255,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: staticCourseList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, i) {
                        final data = staticCourseList[i];

                        return CourseCard(
                          imagePath: data.imageUrl,
                          title: data.title,
                          course: data.course,
                          time: data.time,
                          cardColor: getColorCourseCard(data.type).cardColor,
                          textColor: getColorCourseCard(data.type).textColor,
                          buttonColor:
                              getColorCourseCard(data.type).buttonColor,
                          buttonTextColor:
                              getColorCourseCard(data.type).buttonTextColor,
                          timeTextColor:
                              getColorCourseCard(data.type).timeTextColor,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 27,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.backgroundColorBlack,
                      image: DecorationImage(
                        image: AssetImage(ImageAssets.meditation),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: AppStrings.homeDaily,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColorWhite,
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                AppText(
                                  text: AppStrings.homeMeditation,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColorWhite,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 3,
                                ),
                                AppText(
                                  text: "3-10 MIN",
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColorWhite,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: AppColors.textColorBlack,
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  AppText(
                    text: AppStrings.homeRecommendation,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColorBlack,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 169,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: staticRecommendList.length,
                      separatorBuilder: (context, i) => SizedBox(width: 20),
                      itemBuilder: (context, i) {
                        final data = staticRecommendList[i];

                        return RecommendCard(
                          imagePath: data.imagePath,
                          title: data.title,
                          color: getColorRecommendCard(data.type),
                          time: data.time,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
