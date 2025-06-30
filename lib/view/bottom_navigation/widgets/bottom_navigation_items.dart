import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

List<PersistentBottomNavBarItem> buildNavbarItems(int index) {
  final isSleepTab = index == 1;
  final activeColor = AppColors.primaryColor;
  final inactiveColor = isSleepTab ? Colors.grey : Colors.transparent;
  final iconColor = isSleepTab ? Colors.white : AppColors.primaryColor;

  return [
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.home_outlined,
        color: iconColor,
      ),
      activeColorPrimary: activeColor,
      inactiveColorPrimary: inactiveColor,
      title: AppStrings.home,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.nightlight_round_outlined,
        color: iconColor,
      ),
      activeColorPrimary: activeColor,
      inactiveColorPrimary: inactiveColor,
      title: AppStrings.sleep,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.medical_information_outlined,
        color: iconColor,
      ),
      activeColorPrimary: activeColor,
      inactiveColorPrimary: inactiveColor,
      title: AppStrings.meditate,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.music_note_outlined,
        color: iconColor,
      ),
      activeColorPrimary: activeColor,
      inactiveColorPrimary: inactiveColor,
      title: AppStrings.music,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.person_2_outlined,
        color: iconColor,
      ),
      activeColorPrimary: activeColor,
      inactiveColorPrimary: inactiveColor,
      title: AppStrings.profile,
    ),
  ];
}
