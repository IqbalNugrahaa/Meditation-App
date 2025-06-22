import 'package:flutter/material.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/components/app_text.dart';

class EmptyPage extends StatelessWidget {
  final String? routeName;

  const EmptyPage({super.key, this.routeName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: '404',
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              const SizedBox(height: 16),
              AppText(
                text: 'Oops! Page not found.',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textColorBlack,
              ),
              if (routeName != null) ...[
                const SizedBox(height: 8),
                AppText(
                  text: 'Route: $routeName',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.textColorGrey,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
