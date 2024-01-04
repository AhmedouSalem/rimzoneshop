import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rimzone_shop/controller/auth/forgetpassword/succes_resetpassword_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/view/widget/auth/custombodytext.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuccessResetPasswordController());
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Lottie.asset(
              AppImageAsset.lottieUp,
              width: 250,
              height: 250,
              fit: BoxFit.fill,
            ),
            CustomBodyTextAuth(
              bodyText: "successResetBody".tr,
            ),
          ],
        ),
      ),
    );
  }
}
