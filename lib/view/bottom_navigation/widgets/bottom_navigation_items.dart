import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

List<PersistentBottomNavBarItem> buildNavbarItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home_outlined),
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: Colors.transparent,
      title: AppStrings.home,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.nightlight_round_outlined),
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: Colors.transparent,
      title: AppStrings.sleep,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.medical_information_outlined),
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: Colors.transparent,
      title: AppStrings.meditate,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.music_note_outlined),
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: Colors.transparent,
      title: AppStrings.music,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.person_2_outlined),
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: Colors.transparent,
      title: AppStrings.profile,
    ),
  ];
}
