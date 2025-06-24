import 'package:flutter/material.dart';
import 'package:metidation_app/core/components/app_text.dart';

import '../../../core/constants/app_colors.dart';

class DayCard extends StatelessWidget {
  final double width, height;
  final String title;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;
  const DayCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.color = AppColors.backgroundColorGrey,
    this.width = 40.75,
    this.height = 40.75,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? color : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.borderColorGrey,
            width: 1,
          ),
        ),
        child: Center(
          child: AppText(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            color:
                isSelected ? AppColors.textColorWhite : AppColors.textColorGrey,
          ),
        ),
      ),
    );
  }
}
