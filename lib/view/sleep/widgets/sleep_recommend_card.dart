import 'package:flutter/material.dart';

import '../../../core/components/app_text.dart';
import '../../../core/constants/app_colors.dart';

class SleepRecommendCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String time;
  final String type;
  const SleepRecommendCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.time,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 113.5,
              width: 162,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          AppText(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textColorWhite,
          ),
          SizedBox(height: 3),
          Row(
            spacing: 5,
            children: [
              AppText(
                text: time,
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorWhite,
              ),
              CircleAvatar(
                backgroundColor: AppColors.textColorWhite,
                radius: 3,
              ),
              AppText(
                text: type,
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorWhite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
