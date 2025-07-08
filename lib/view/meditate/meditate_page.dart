import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/core/components/feature_card.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/constants/app_strings.dart';
import 'package:metidation_app/core/utils/media_query_util.dart';
import 'package:metidation_app/data/source/meditate_static_data.dart';
import 'package:metidation_app/viewmodels/meditate/meditate_view_model.dart';

class MeditatePage extends HookConsumerWidget {
  const MeditatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meditateViewModel = ref.read(meditateViewModelProvider.notifier);
    final isSelected = ref.watch(meditateViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: ScreenSize.width(context),
        height: ScreenSize.height(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 65),
            AppText(
              text: AppStrings.meditate,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textColorBlack,
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText(
                text: AppStrings.meditateHeader,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.textColorGrey,
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
                itemCount: staticMeditateList.length,
                separatorBuilder: (context, i) => SizedBox(width: 20),
                itemBuilder: (context, i) {
                  var data = staticMeditateList[i];

                  return FeatureCard(
                    title: data.title,
                    icon: data.icon,
                    isSelected: isSelected == i,
                    onTap: () {
                      meditateViewModel.select(i);
                    },
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
