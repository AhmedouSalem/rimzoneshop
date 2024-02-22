import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/onboarding_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/data/datasource/static/static.dart';
import 'package:rimzone_shop/view/widget/onboarding/customImage.dart';
import 'package:rimzone_shop/view/widget/onboarding/custombutton.dart';
import 'package:rimzone_shop/view/widget/onboarding/customdotconroller.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/view/widget/shared/shared.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImplement());
    return GetBuilder<OnBoardingControllerImplement>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.onBoardingColor[controller.currentPage],
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: CustomImageSliderOnBoarding(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.onBoardingBottomContainer,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppResponsive.fullWidth * 0.15),
                      topRight: Radius.circular(AppResponsive.fullWidth * 0.15),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: AppResponsive.fullHeight * 0.015),
                      const CustomDotControllerOnboarding(),
                      SizedBox(
                        height: AppResponsive.fullHeight * 0.015,
                      ),
                      Text(
                        onboardingBottomList[controller.currentPage].title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(height: AppResponsive.fullHeight * 0.001, fontSize: AppResponsive.fullWidth * 0.05,),
                      ),// 0.8
                      SizedBox(height: AppResponsive.fullWidth * 0.05),
                      Text(
                        textAlign: TextAlign.center,
                        onboardingBottomList[controller.currentPage].body,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: AppResponsive.fullWidth * 0.035),
                      ),
                      const Spacer(),
                      const CustomButtonOnboarding(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
