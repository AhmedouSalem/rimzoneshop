import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rimzone_shop/controller/auth/forgetpassword/verifycode_controller.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';

import 'package:rimzone_shop/view/widget/auth/custombodytext.dart';
import 'package:rimzone_shop/view/widget/shared/customappbar.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/view/widget/shared/shared.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImplement());
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: "CodeVerification".tr),
      body: GetBuilder<VerifyCodeControllerImplement>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loading
                ? Center(
                    child: Lottie.asset(AppImageAsset.lottieLoading,
                        width: 250, height: 250),
                  )
                : SafeArea(
                    maintainBottomViewPadding: true,
                    child: Column(
                      // physics: const ClampingScrollPhysics(),
                      // padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      children: [
                        Image.asset(AppImageAsset.otp, height: AppResponsive.fullHeight * 0.3,),
                        CustomTitleText(title: "OTPVerification".tr),
                        CustomBodyTextAuth(
                          bodyText:
                              "${"VerifyCodeBodyReset".tr} ${"\n"}${controller.email.toLowerCase()}",
                        ),
                        SizedBox(height: AppResponsive.fullWidth * 0.015),
                        OtpTextField(
                          borderWidth: 1.3,
                          cursorColor: AppColor.blackColor,
                          focusedBorderColor: AppColor.blackColor,
                          borderRadius: BorderRadius.circular(50),
                          numberOfFields: 5,
                          borderColor: AppColor.primaryColor,
                          showFieldAsBox: true,
                          onCodeChanged: (String code) {},
                          onSubmit: (String verificationCode) {
                            controller.goToResetPassword(verificationCode);
                          },
                        ),
                        CustomButtonPrimary(
                          buttonColor: AppColor.primaryColor,
                          textButton: "Resend code",
                          textColor: AppColor.secondColor,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 20.0,
                          ),
                          isLoading: false,
                          onPressed: () async {
                            await controller.resendEmail();
                          },
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
