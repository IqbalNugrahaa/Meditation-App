import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/constants/image_assets.dart';
import 'package:metidation_app/data/model/request/account/topic_request.dart';
import 'package:metidation_app/data/source/topic_static_data.dart';
import 'package:metidation_app/view/topic/utils/topic_card_util.dart';
import 'package:metidation_app/view/topic/widgets/topic_card.dart';
import 'package:metidation_app/viewmodels/topic/topic_view_model.dart';

import '../../core/components/app_button.dart';
import '../../core/constants/app_strings.dart';

class TopicPage extends HookConsumerWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(topicViewModelProvider);
    final topicViewModel = ref.read(topicViewModelProvider.notifier);

    ref.listen(topicViewModelProvider.select((s) => s.notificationId),
        (prev, next) {
      final state = ref.read(topicViewModelProvider);

      if (state.successMessage != null) {
        Fluttertoast.showToast(msg: state.successMessage ?? "");
        context.push('/reminder');
      } else {
        Fluttertoast.showToast(msg: state.errorMessage ?? "");
      }
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.greyColor,
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                ImageAssets.topic,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 76, left: 20, right: 20),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: AppStrings.topicHeader,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColorBlack,
                        ),
                        AppText(
                          text: AppStrings.toSilentMoon,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColorBlack,
                        ),
                        const SizedBox(height: 10),
                        AppText(
                          text: AppStrings.chooseTopic,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: AppColors.textColorGrey,
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                  SliverMasonryGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childCount: staticTopicList.length,
                    itemBuilder: (context, i) {
                      final data = staticTopicList[i];
                      return TopicCard(
                        title: data.title,
                        height: getCardHeight(i),
                        color: getColorCard(data.topicType),
                        imageAsset: data.image,
                        isSelected: selected.topicId == data.id,
                        onTap: () {
                          topicViewModel.select(
                            topicId: data.id,
                            topicName: data.title,
                          );
                        },
                      );
                    },
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 60),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 32,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.3),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: selected.topicId != null
                    ? AppButton.contained(
                        text: AppStrings.next,
                        onPressed: () {
                          topicViewModel.updateTopic(
                            TopicRequestModel(
                              id: selected.topicId ?? "",
                              name: selected.topicName ?? "",
                            ),
                          );
                        },
                        backgroundColor: AppColors.buttonColorPurple,
                        borderRadius: 32,
                        fontSize: 16,
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
