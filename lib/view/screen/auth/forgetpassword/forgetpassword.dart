import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';
import 'package:rimzone_shop/view/widget/auth/Customformfield.dart';
import 'package:rimzone_shop/view/widget/shared/customappbar.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';
import 'package:rimzone_shop/view/widget/auth/custombodytext.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/view/widget/shared/shared.dart';

class ForgetPasswordAuth extends StatelessWidget {
  const ForgetPasswordAuth({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImplement forgetPasswordControllerImplement =
        Get.put(ForgetPasswordControllerImplement());
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: "ForgetPassword".tr),
      body: SafeArea(
        maintainBottomViewPadding: true,
        minimum: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Form(
          key: forgetPasswordControllerImplement.formState,
          child: Column(
            // physics: const ClampingScrollPhysics(),
            // padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: [
              Image.asset(AppImageAsset.forgetPassword, height: AppResponsive.fullHeight * 0.3,),
              CustomTitleText(
                title: "${"Check".tr}"
                    "${"The".tr.toLowerCase()}"
                    "${"Email".tr.toLowerCase()}",
              ),
              CustomBodyTextAuth(
                bodyText: "ForgetPasswordBody".tr,
              ),
              SizedBox(height: AppResponsive.fullWidth * 0.015),
              GetBuilder<ForgetPasswordControllerImplement>(
                builder: (controller) => Column(
                  children: [
                    CustomTextFormFieldAuth(
                      fontSize: controller.lang == "ar" ? 10.0 : 14.7,
                      validator: (val) {
                        controller.validatorInput(val!, 3, 100, "email");
                        return null;
                      },
                      isAutoFocus: controller.isEmailFocus,
                      labelText: "Email".tr,
                      textEditingController:
                          forgetPasswordControllerImplement.email,
                      suffixIcon: Icons.email_outlined,
                      boolObscureText: false,
                      focusNode: controller.focusNode,
                      iconColor: controller.isEmailFocus
                          ? controller.primaryColor
                          : controller.secondColor,
                      onTapField: () => controller.onTapField(),
                      borderColor: controller.isEmailFocus
                          ? controller.primaryColor
                          : controller.secondColor,
                      labelColor: controller.isEmailFocus
                          ? controller.primaryColor
                          : controller.secondColor,
                    ),
                    controller.msgError.isNotEmpty
                        ? Text(
                            controller.msgError,
                            style: const TextStyle(color: AppColor.redColor),
                          )
                        : const SizedBox.shrink(),
                    CustomButtonPrimary(
                      buttonColor: AppColor.primaryColor,
                      textButton: "Search".tr,
                      textColor: AppColor.secondColor,
                      margin: EdgeInsets.zero,
                      onPressed: controller.isLoading
                          ? null
                          : () {
                              controller.goToVerifyCode();
                            },
                      isLoading: controller.isLoading,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
