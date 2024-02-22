import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/auth/joinapp_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/core/functions/appalertexit.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/view/widget/shared/shared.dart';

class JoinApp extends StatelessWidget {
  const JoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JoinAppControllerImplement());
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      body: WillPopScope(
        onWillPop: appAlertExit,
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                fit: BoxFit.fill,
                AppImageAsset.authPageImage,
                width: double.infinity,
                height: AppResponsive.fullHeight * 0.4,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          width: 40.0,
                          height: 40.0,
                          AppImageAsset.logoApp,
                        ),
                        Text(
                          "RimZone Shop",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontFamily: "Pacifico",
                                    fontSize: 20,
                                  ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      alignment: Alignment.topCenter,
                      child: Text(
                        textAlign: TextAlign.start,
                        "authPageTitle".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 1),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      alignment: Alignment.topCenter,
                      child: Text(
                        textAlign: TextAlign.start,
                        "authPageBody".tr,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    GetBuilder<JoinAppControllerImplement>(
                      builder: (controller) {
                        return Column(
                          children: [
                            CustomButtonPrimary(
                              margin: const EdgeInsets.only(bottom: 20.0),
                              buttonColor: AppColor.secondColor,
                              textButton: "letsGo".tr,
                              textColor: AppColor.primaryColor,
                              onPressed: controller.isLoadingGetStarted
                                  ? null
                                  : () {
                                      controller.getStarted();
                                    },
                              isLoading: controller.isLoadingGetStarted,
                            ),
                            CustomButtonPrimary(
                              margin: EdgeInsets.zero,
                              buttonColor: AppColor.primaryColor,
                              textButton: "signUpUnderText".tr,
                              textColor: AppColor.secondColor,
                              onPressed: controller.isLoadingGoToSignIn
                                  ? null
                                  : () {
                                      controller.goToSignIn();
                                    },
                              isLoading: controller.isLoadingGoToSignIn,
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
