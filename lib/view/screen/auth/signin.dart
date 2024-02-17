import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/auth/signin_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/functions/appalertexit.dart';
import 'package:rimzone_shop/view/widget/auth/Customformfield.dart';
import 'package:rimzone_shop/view/widget/auth/customlinkforgetpassword.dart';
import 'package:rimzone_shop/view/widget/auth/customprovidersection.dart';
import 'package:rimzone_shop/view/widget/auth/logoauth.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';
import 'package:rimzone_shop/view/widget/auth/custombodytext.dart';
import 'package:rimzone_shop/view/widget/auth/customdivider.dart';
import 'package:get/get.dart';

import '../../widget/shared/customtitletext.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInControllerImplement signInControllerImplement =
        Get.put(SignInControllerImplement());
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      body: WillPopScope(
        onWillPop: appAlertExit,
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Form(
            key: signInControllerImplement.formState,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  // Dynamic Content
                  GetBuilder<SignInControllerImplement>(
                    builder: (controller) {
                      return controller.isOpenKeyboard == false
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const LogoAuth(),
                                CustomTitleText(title: "Login".tr),
                                const SizedBox(height: 10.0),
                                CustomBodyTextAuth(
                                  bodyText: "loginBody".tr,
                                ),
                                const SizedBox(height: 30.0),
                              ],
                            )
                          : const SizedBox(height: 30.0);
                    },
                  ),
                  // Start TextFormFields
                  GetBuilder<SignInControllerImplement>(
                    builder: (controller) {
                      return CustomTextFormFieldAuth(
                        fontSize: controller.lang == "ar" ? 10.0 : 14.7,
                        labelColor: controller.isEmailAutoFocus
                            ? controller.borderColor
                            : controller.color,
                        borderColor: controller.isEmailAutoFocus
                            ? controller.borderColor
                            : controller.color,
                        onTapField: () => controller.onTapFieldEmail(),
                        isAutoFocus: controller.isEmailAutoFocus,
                        focusNode: controller.emailFocusNode,
                        boolObscureText: false,
                        labelText: "${"Username".tr}"
                            "${" "}"
                            "${"Or".tr}"
                            "${" "}"
                            "${"Email".tr.toLowerCase()}",
                        textEditingController: controller.email,
                      );
                    },
                  ),
                  GetBuilder<SignInControllerImplement>(
                    builder: (controller) {
                      return CustomTextFormFieldAuth(
                        fontSize: controller.lang == "ar" ? 10.0 : 14.7,
                        labelColor: controller.isPasswordAutoFocus
                            ? controller.borderColor
                            : controller.color,
                        borderColor: controller.isPasswordAutoFocus
                            ? controller.borderColor
                            : controller.color,
                        onTapField: () => controller.onTapFieldPassword(),
                        focusNode: controller.passwordFocusNode,
                        isAutoFocus: controller.isPasswordAutoFocus,
                        suffixIcon: controller.iconData,
                        boolObscureText: controller.isShowPassword,
                        labelText: "Password".tr,
                        textEditingController: controller.password,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                      );
                    },
                  ),
                  // End TextFormFields
                  const CustomLinkForgetPassword(),
                  GetBuilder<SignInControllerImplement>(
                    builder: (controller) => CustomButtonPrimary(
                      buttonColor: AppColor.primaryColor,
                      textButton: "Login".tr,
                      textColor: AppColor.secondColor,
                      margin: const EdgeInsets.symmetric(vertical: 25.0),
                      onPressed: controller.isLoadingSignIn
                          ? null
                          : () {
                              signInControllerImplement.signIn();
                            },
                      isLoading: controller.isLoadingSignIn,
                    ),
                  ),
                  // Dynamic Content
                  GetBuilder<SignInControllerImplement>(
                    builder: (controller) {
                      return controller.isOpenKeyboard == false
                          ? Column(
                              children: [
                                const CustomDividerAuth(),
                                const SizedBox(height: 10.0),
                                const CustomProviderSection(),
                                const SizedBox(
                                  height: 50.0,
                                ),
                                CustomButtonPrimary(
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  buttonColor: AppColor.secondColor,
                                  textButton: "loginUnderText".tr,
                                  textColor: AppColor.primaryColor,
                                  onPressed: controller.isLoadingGoToSignUp
                                      ? null
                                      : () {
                                          controller.goToSignUp();
                                        },
                                  isLoading: controller.isLoadingGoToSignUp,
                                ),
                              ],
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
