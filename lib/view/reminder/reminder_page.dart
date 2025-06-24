import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/core/components/app_button.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/data/source/day_static_data.dart';
import 'package:metidation_app/view/reminder/widgets/day_card.dart';

import 'widgets/wheel_picker.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../viewmodels/reminder/reminder_view_model.dart';

class ReminderPage extends HookConsumerWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeState = ref.watch(reminderViewModelProvider);
    final viewModel = ref.read(reminderViewModelProvider.notifier);

    // Format 24 jam
    final hours = List<String>.generate(
      24,
      (index) => index.toString().padLeft(2, '0'),
    );
    final minutes = List<String>.generate(
      60,
      (index) => index.toString().padLeft(2, '0'),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 82.21),
                Padding(
                  padding: const EdgeInsets.only(right: 119.49),
                  child: AppText(
                    text: AppStrings.reminderHeader,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColorBlack,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 27),
                  child: AppText(
                    text: AppStrings.reminderRecommendation,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textColorGrey,
                  ),
                ),
                SizedBox(height: 29.79),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.7,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColorBrokenWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: WheelPicker(
                          items: hours,
                          selectedIndex: timeState.hour,
                          onSelectedItemChanged: viewModel.setHour,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: WheelPicker(
                          items: minutes,
                          selectedIndex: timeState.minute,
                          onSelectedItemChanged: viewModel.setMinute,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.14),
                Padding(
                  padding: const EdgeInsets.only(right: 119.49),
                  child: AppText(
                    text: AppStrings.reminderDay,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColorBlack,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 27),
                  child: AppText(
                    text: AppStrings.reminderDayRecommendation,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textColorGrey,
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  height: 42,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: staticDayList.length,
                    separatorBuilder: (context, i) => SizedBox(width: 14),
                    itemBuilder: (context, i) {
                      var data = staticDayList[i];

                      return DayCard(
                        title: data.title,
                        isSelected: timeState.selectedDays.contains(data.value),
                        onTap: () {
                          viewModel.toggleDay(data.value);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 52.27),
                AppButton.contained(
                  text: AppStrings.save,
                  onPressed: () {},
                  borderRadius: 38,
                  backgroundColor: AppColors.buttonColorPurple,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/bottom-navigation',
                      (route) => false,
                    );
                  },
                  child: AppText(
                    text: AppStrings.noThanks,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColorBlack,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 46.99),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
