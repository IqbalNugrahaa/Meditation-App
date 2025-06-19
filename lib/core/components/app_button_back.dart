import 'package:flutter/material.dart';
import 'package:metidation_app/core/constants/app_colors.dart';

class AppButtonBack extends StatelessWidget {
  final double height, width;
  final Color backgroundColor, borderColor;
  final VoidCallback onTap;
  const AppButtonBack({
    super.key,
    required this.onTap,
    this.height = 55,
    this.width = 55,
    this.backgroundColor = Colors.white,
    this.borderColor = AppColors.borderColorGrey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
