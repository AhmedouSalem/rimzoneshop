import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rimzone_shop/controller/auth/signup_controller/verifycodesignup_controller.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';

import 'package:rimzone_shop/view/widget/auth/custombodytext.dart';
import 'package:rimzone_shop/view/widget/shared/customappbar.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImplement());
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      appBar: CustomAppBar(title: "CodeVerification".tr),
      body: GetBuilder<VerifyCodeSignUpControllerImplement>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loading
                ? Center(
                    child: Lottie.asset(AppImageAsset.lottieLoading),
                  )
                : SafeArea(
                    maintainBottomViewPadding: true,
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      children: [
                        Image.asset(AppImageAsset.otp),
                        CustomTitleText(title: "OTPVerification".tr),
                        CustomBodyTextAuth(
                          bodyText:
                              "${"VerifyCodeBodySignUp".tr} ${"\n"}${controller.email.toLowerCase()}",
                        ),
                        const SizedBox(height: 20.0),
                        OtpTextField(
                          borderWidth: 1.3,
                          cursorColor: AppColor.blackColor,
                          focusedBorderColor: AppColor.blackColor,
                          borderRadius: BorderRadius.circular(50),
                          numberOfFields: 5,
                          borderColor: AppColor.primaryColor,
                          showFieldAsBox: true,
                          onCodeChanged: (String code) {},
                          onSubmit: (String verificationCode) async {
                            await controller.goToLogin(verificationCode);
                          },
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
