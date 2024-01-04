import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/auth/signin_controller.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomLinkForgetPassword extends GetView<SignInControllerImplement> {
  const CustomLinkForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: InkWell(
        splashColor: AppColor.secondColor,
        highlightColor: AppColor.secondColor,
        onTap: () {
          controller.goToForgetPassword();
        },
        child: Text(
          textAlign: TextAlign.end,
          "ForgetPassword".tr,
          style: const TextStyle(color: AppColor.blackColor),
        ),
      ),
    );
  }
}
