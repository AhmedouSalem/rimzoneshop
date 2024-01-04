import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/onboarding_controller.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/static.dart';

class CustomImageSliderOnBoarding
    extends GetView<OnBoardingControllerImplement> {
  const CustomImageSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const ClampingScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onboardingImageList.length,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              onboardingImageList[index].photo,
            ),
          ],
        );
      },
    );
  }
}
