import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rimzone_shop/controller/auth/signup_controller/success_signup_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/view/widget/auth/custombodytext.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuccessSignUpController());
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Lottie.asset(
              AppImageAsset.lottieCongrats,
              fit: BoxFit.fill,
            ),
            CustomBodyTextAuth(bodyText: "successCreateBody".tr)
          ],
        ),
      ),
    );
  }
}
