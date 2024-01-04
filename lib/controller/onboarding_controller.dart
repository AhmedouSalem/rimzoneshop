import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/static/static.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImplement extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;

  AppServices appServices = Get.find<AppServices>();

  @override
  next() async {
    currentPage++;
    if (currentPage == onboardingBottomList.length) {
      await appServices.sharedPreferences.setString("step", "1");
      await Get.offAllNamed(AppRoutes.signIn);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
