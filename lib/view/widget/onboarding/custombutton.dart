import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/onboarding_controller.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolor.dart';
import '../../../data/datasource/static/static.dart';

class CustomButtonOnboarding extends StatelessWidget {
  const CustomButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImplement>(
      builder: (controller) => Container(
        height: 45.0,
        margin: const EdgeInsets.only(bottom: 25.0),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          minWidth: 200.0,
          color: controller.currentPage == onboardingBottomList.length - 1
              ? AppColor.primaryColor
              : AppColor.secondColor,
          onPressed: () {
            controller.next();
          },
          child: Text(
            textAlign: TextAlign.center,
            onboardingBottomList[controller.currentPage].textButton,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color:
                      controller.currentPage == onboardingBottomList.length - 1
                          ? const Color(0xfffafdfc)
                          : AppColor.blackColor,
                ),
          ),
        ),
      ),
    );
  }
}
