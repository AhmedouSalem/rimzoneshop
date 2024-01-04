import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';
import 'package:rimzone_shop/view/widget/auth/Customformfield.dart';
import 'package:rimzone_shop/view/widget/shared/customappbar.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';
import 'package:rimzone_shop/view/widget/auth/custombodytext.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImplement resetPasswordControllerImplement =
        Get.put(ResetPasswordControllerImplement());
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      appBar: CustomAppBar(
          title:
              "${"Reset".tr} ${"Le".tr.toLowerCase()} ${"Password".tr.toLowerCase()}"),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: resetPasswordControllerImplement.formState,
            child: Column(
              children: [
                CustomTitleText(title: "NewPassword".tr),
                CustomBodyTextAuth(
                  bodyText: "ResetPasswordBody".tr,
                ),
                const SizedBox(height: 20.0),
                GetBuilder<ResetPasswordControllerImplement>(
                  builder: (controller) => Column(
                    children: [
                      CustomTextFormFieldAuth(
                        fontSize: controller.lang == "ar" ? 10.0 : 14.7,
                        validator: (val) {
                          controller.validatorInput(val!, 8, 40, "password");
                          return null;
                        },
                        onTapField: () => controller.onTapFieldPassword(),
                        isAutoFocus: controller.isPasswordFocus,
                        focusNode: controller.focusNodePassword,
                        labelText: "NewPassword".tr,
                        textEditingController: controller.password,
                        suffixIcon: controller.iconData,
                        boolObscureText: controller.isShowPassword,
                        onTapIcon: () => controller.showPassword(),
                        borderColor: controller.isPasswordFocus
                            ? controller.primaryColor
                            : controller.secondColor,
                        labelColor: controller.isPasswordFocus
                            ? controller.primaryColor
                            : controller.secondColor,
                      ),
                      CustomTextFormFieldAuth(
                        fontSize: controller.lang == "ar" ? 10.0 : 14.7,
                        onTapField: () =>
                            controller.onTapFieldConfirmPassword(),
                        labelColor: controller.isConfirmPassFocus
                            ? controller.pConfirmColor
                            : controller.secondConfirmColor,
                        borderColor: controller.isConfirmPassFocus
                            ? controller.pConfirmColor
                            : controller.secondConfirmColor,
                        isAutoFocus: controller.isConfirmPassFocus,
                        focusNode: controller.focusNodeConfirmPass,
                        labelText: "${"Confirm".tr}"
                            "${"Le".tr.toLowerCase()}"
                            " "
                            "${"Password".tr.toLowerCase()}",
                        textEditingController: controller.confirmPassword,
                        boolObscureText: controller.isShowPassword,
                      ),
                      controller.msgError.isNotEmpty
                          ? Text(
                              controller.msgError,
                              style: const TextStyle(color: AppColor.redColor),
                            )
                          : const SizedBox.shrink(),
                      controller.textIsMatch.isNotEmpty
                          ? Text(
                              controller.textIsMatch,
                              style: const TextStyle(color: AppColor.redColor),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                GetBuilder<ResetPasswordControllerImplement>(
                  builder: (controller) => CustomButtonPrimary(
                    buttonColor: AppColor.primaryColor,
                    textButton: "Save".tr,
                    textColor: AppColor.secondColor,
                    margin: EdgeInsets.zero,
                    onPressed: controller.isLoading
                        ? null
                        : () async {
                            await controller.goToLogin();
                          },
                    isLoading: controller.isLoading,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
