import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/onboarding_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/data/datasource/static/static.dart';
import 'package:rimzone_shop/view/widget/onboarding/customImage.dart';
import 'package:rimzone_shop/view/widget/onboarding/custombutton.dart';
import 'package:rimzone_shop/view/widget/onboarding/customdotconroller.dart';
import 'package:get/get.dart';

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
                  decoration: const BoxDecoration(
                    color: AppColor.onBoardingBottomContainer,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                      topRight: Radius.circular(80.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 20.0),
                      const CustomDotControllerOnboarding(),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        onboardingBottomList[controller.currentPage].title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        textAlign: TextAlign.center,
                        onboardingBottomList[controller.currentPage].body,
                        style: Theme.of(context).textTheme.bodyLarge!,
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
