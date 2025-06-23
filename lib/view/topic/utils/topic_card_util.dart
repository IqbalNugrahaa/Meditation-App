import 'package:flutter/material.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/constants/image_assets.dart';

double getCardHeight(int index) {
  switch (index % 4) {
    case 0:
      return 210;
    case 1:
      return 167;
    case 2:
      return 210;
    case 3:
      return 167;
    default:
      return 167; // fallback, meskipun tidak pernah terjadi
  }
}

Color getColorCard(String value) {
  switch (value) {
    case "Stress":
      return AppColors.cardStress;
    case "Performance":
      return AppColors.cardPerformance;
    case "Happiness":
      return AppColors.cardHappiness;
    case "Anxiety":
      return AppColors.cardAnxiety;
    case "Growth":
      return AppColors.cardGrowth;
    case "Sleep":
      return AppColors.cardSleep;
    default:
      return AppColors.cardStress;
  }
}

String getImageAssetCard(String value) {
  switch (value) {
    case "Stress":
      return ImageAssets.stress;
    case "Performance":
      return ImageAssets.performance;
    case "Happiness":
      return ImageAssets.happiness;
    case "Anxiety":
      return ImageAssets.anxiety;
    case "Growth":
      return ImageAssets.growth;
    case "Sleep":
      return ImageAssets.sleep;
    default:
      return ImageAssets.stress;
  }
}
