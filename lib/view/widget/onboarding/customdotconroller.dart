import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/onboarding_controller.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolor.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotControllerOnboarding extends StatelessWidget {
  const CustomDotControllerOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImplement>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onboardingImageList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5.0),
              duration: const Duration(microseconds: 900),
              decoration: BoxDecoration(
                color: controller.currentPage == index
                    ? AppColor.primaryColor
                    : AppColor.onBoardingColor[1],
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: 8,
              height: 8,
            ),
          ),
        ],
      ),
    );
  }
}
