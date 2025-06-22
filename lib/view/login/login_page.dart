import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_button_back.dart';
import '../../core/components/app_text.dart';
import '../../core/components/app_text_field.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/image_assets.dart';
import '../../core/utils/media_query_util.dart';
import '../../viewmodels/login/login_view_model.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final loginState = ref.watch(loginViewModelProvider);
    final viewModel = ref.read(loginViewModelProvider.notifier);

    ref.listen(loginViewModelProvider.select((s) => s.notificationId),
        (prev, next) {
      final state = ref.read(loginViewModelProvider);

      if (state.errorMessage != null) {
        Fluttertoast.showToast(msg: state.errorMessage!);
      }

      if (state.isSuccess == true) {
        Fluttertoast.showToast(msg: state.successMessage!);
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/welcome',
          (route) => false,
        );
      }
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset(
              ImageAssets.frameSignup,
            ),
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
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
                      SizedBox(
                        width: ScreenSize.width(context),
                        child: AppText(
                          text: AppStrings.headingLogin,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 33),
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
                      SizedBox(height: 40),
                      AppTextField(
                        hint: AppStrings.hintEmail,
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.msgEmptyEmail;
                          }

                          return null;
                        },
                        errorText: loginState.errorTextField,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20),
                      AppTextField.password(
                        hint: AppStrings.hintPassword,
                        controller: passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.msgEmptyPassword;
                          }
                          if (value.length < 6) {
                            return AppStrings.msgLengthPassword;
                          }

                          return null;
                        },
                        errorText: loginState.errorTextField,
                      ),
                      SizedBox(height: 30),
                      loginState.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.buttonColorPurple,
                              ),
                            )
                          : AppButton.contained(
                              backgroundColor: AppColors.buttonColorPurple,
                              text: AppStrings.login,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  viewModel.login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              borderRadius: 38,
                            ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: ScreenSize.width(context),
                        child: AppText(
                          text: '${AppStrings.forgotPassword}?',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorBlack,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 104.53),
                      Row(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: AppStrings.notHaveAnAccount,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColorGrey,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: AppText(
                              text: AppStrings.signUp.toUpperCase(),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColorPurple,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
