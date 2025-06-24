import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/core/components/app_button.dart';
import 'package:metidation_app/core/components/app_button_back.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/core/components/app_text_field.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/constants/app_strings.dart';
import 'package:metidation_app/core/constants/image_assets.dart';
import 'package:metidation_app/core/utils/media_query_util.dart';
import 'package:metidation_app/viewmodels/register/register_view_model.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final registerState = ref.watch(registerViewModelProvider);
    final viewModel = ref.read(registerViewModelProvider.notifier);

    ref.listen(registerViewModelProvider.select((s) => s.notificationId),
        (prev, next) {
      final state = ref.read(registerViewModelProvider);

      if (state.toastMessage != null) {
        Fluttertoast.showToast(msg: state.toastMessage!);
      }

      if (state.isSuccess && state.successMessage != null) {
        Fluttertoast.showToast(msg: state.successMessage!);
        Navigator.pushNamed(context, '/login');
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
                          text: AppStrings.headingRegister,
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
                        borderColor: AppColors.borderColorBrokenWhite,
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
                        errorText: registerState.errorTextField,
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
                        errorText: registerState.errorTextField,
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        trailing: Checkbox(
                          value: registerState.isAgreed,
                          onChanged: (_) => viewModel.toggleAgreement(),
                          activeColor: AppColors.buttonColorPurple,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText(
                              text: AppStrings.agreement,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColorGrey,
                            ),
                            SizedBox(width: 4),
                            AppText(
                              text: AppStrings.privacyPolicy,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColorPrivacyPolicy,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.83),
                      registerState.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.buttonColorPurple,
                              ),
                            )
                          : AppButton.contained(
                              backgroundColor: AppColors.buttonColorPurple,
                              text: AppStrings.getStarted,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  viewModel.register(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              borderRadius: 38,
                            ),
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
