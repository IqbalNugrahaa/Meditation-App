import 'package:flutter/material.dart';
import 'package:metidation_app/core/constants/app_colors.dart';

class AppSeparator extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Axis axis;

  const AppSeparator({
    super.key,
    this.height = 1,
    this.width = double.infinity,
    this.color = AppColors.textInactiveSleep,
    this.axis = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal
        ? Container(
            height: height,
            width: width,
            color: color,
          )
        : Container(
            width: height,
            height: width,
            color: color,
          );
  }
}
