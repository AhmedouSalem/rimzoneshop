import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/auth/signup_controller/createaccount_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/auth/custombottomtext.dart';
import 'package:rimzone_shop/view/widget/auth/signup/customslider.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';
import 'package:get/get.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateAccountControllerImplement());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Expanded(
              child: CustomSliderSignUp(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            GetBuilder<CreateAccountControllerImplement>(
              builder: (controller) {
                return CustomButtonPrimary(
                  buttonColor: AppColor.primaryColor,
                  textButton: "Next".tr,
                  textColor: AppColor.secondColor,
                  margin: const EdgeInsets.only(
                    bottom: 30.0,
                    right: 15.0,
                    left: 15.0,
                  ),
                  onPressed: controller.isLoading
                      ? null
                      : () {
                          controller.nextPage();
                        },
                  isLoading: controller.isLoading,
                );
              },
            ),
            GetBuilder<CreateAccountControllerImplement>(
              builder: (controller) {
                return controller.isOpenKeyboard
                    ? const SizedBox.shrink()
                    : CustomBottomTextAuth(
                        signInOrSignUp: "signUpUnderText".tr,
                        onTap: () {
                          controller.goToSign();
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
