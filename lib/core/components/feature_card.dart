import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/core/constants/app_colors.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;
  const FeatureCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 92,
        width: 65,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.buttonInactiveSleep,
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  height: 25,
                  width: 25,
                ),
              ),
            ),
            AppText(
              text: title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? AppColors.textColorWhite
                  : AppColors.textInactiveSleep,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
