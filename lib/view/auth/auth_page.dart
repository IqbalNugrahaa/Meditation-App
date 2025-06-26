import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metidation_app/core/components/app_button.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/constants/app_strings.dart';
import 'package:metidation_app/core/constants/icon_assets.dart';
import 'package:metidation_app/core/constants/image_assets.dart';
import 'package:metidation_app/core/utils/media_query_util.dart';
import 'package:metidation_app/core/components/app_text.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: ScreenSize.width(context),
                    child: Image.asset(
                      ImageAssets.frame,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            AppText(
                              text: AppStrings.appName.split(" ")[0],
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textColorBlack,
                            ),
                            SvgPicture.asset(IconAssets.logo),
                            AppText(
                              text: AppStrings.appName.split(" ")[1],
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textColorBlack,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: Image.asset(
                          ImageAssets.dayAuth,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppText(
                text: AppStrings.headingAuth,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 58,
                ),
                child: AppText(
                  text: AppStrings.titleAuth,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 62),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: AppButton.contained(
                  text: AppStrings.signUp,
                  onPressed: () {
                    context.push('/register');
                  },
                  backgroundColor: AppColors.buttonColorPurple,
                  width: ScreenSize.width(context),
                  height: 63,
                  borderRadius: 38,
                ),
              ),
              SizedBox(height: 20),
              Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: AppStrings.alreadyHaveAnAccount,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColorGrey,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push('/login');
                    },
                    child: AppText(
                      text: AppStrings.login.toUpperCase(),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorPurple,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
