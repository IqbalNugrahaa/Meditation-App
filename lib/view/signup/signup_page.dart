import 'package:flutter/material.dart';
import 'package:metidation_app/core/components/app_button.dart';
import 'package:metidation_app/core/components/app_button_back.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/constants/app_strings.dart';
import 'package:metidation_app/core/constants/image_assets.dart';
import 'package:metidation_app/core/utils/media_query_util.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset(
              ImageAssets.frameSignup,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 20.24,
                right: 20.24,
                bottom: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButtonBack(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 28.47),
                  AppButton.contained(
                    width: ScreenSize.width(context),
                    text: AppStrings.buttonFacebook,
                    backgroundColor: AppColors.buttonColorFacebook,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    leading: Image.asset(
                      ImageAssets.facebook,
                      height: 20,
                    ),
                    borderRadius: 38,
                    onPressed: () {},
                  ),
                  SizedBox(height: 20),
                  AppButton.outline(
                    text: AppStrings.buttonGoogle,
                    borderRadius: 38,
                    borderColor: AppColors.borderColorGrey,
                    textColor: AppColors.textColorBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    leading: Image.asset(
                      ImageAssets.google,
                      height: 20,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: ScreenSize.width(context),
                    child: AppText(
                      text: AppStrings.loginEmail,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColorGrey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
