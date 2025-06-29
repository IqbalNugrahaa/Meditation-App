import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

Color getColorRecommendCard(String value) {
  switch (value) {
    case "focus":
      return AppColors.cardFocus;
    case "happiness":
      return AppColors.cardHappiness;
    case "performance":
      return AppColors.cardPerformance;
    default:
      return AppColors.cardFocus;
  }
}
