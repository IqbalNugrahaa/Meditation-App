import 'package:flutter/material.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/core/constants/app_colors.dart';

import '../../../core/constants/app_strings.dart';

class RecommendCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String time;
  final Color color;
  const RecommendCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 113.5,
            width: 162,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          AppText(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textColorBlack,
          ),
          SizedBox(height: 3),
          Row(
            spacing: 5,
            children: [
              AppText(
                text: AppStrings.homeMeditation,
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorGrey,
              ),
              CircleAvatar(
                backgroundColor: AppColors.textColorGrey,
                radius: 3,
              ),
              AppText(
                text: time,
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
