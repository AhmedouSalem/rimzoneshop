import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/home_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';

class CustomCardHome extends StatelessWidget {
  const CustomCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImplement>(
      builder: (controller) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(height: Get.width / 2),
            Container(
              padding: const EdgeInsets.all(15.0),
              alignment:
                  controller.appServices.sharedPreferences.getString("lang") ==
                          "ar"
                      ? Alignment.topRight
                      : Alignment.topLeft,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: Get.width / 2.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: Get.width / 2,
                    child: const Text(
                      "Clearance Sales",
                      style: TextStyle(
                        color: AppColor.secondColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: AppColor.secondColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Text("%   Up to 50 %"),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 6.5,
              right:
                  controller.appServices.sharedPreferences.getString("lang") !=
                          "ar"
                      ? -Get.width / 60.0
                      : null,
              left:
                  controller.appServices.sharedPreferences.getString("lang") ==
                          "ar"
                      ? -Get.width / 60.0
                      : null,
              child: Image.asset(
                fit: BoxFit.fitHeight,
                width: Get.width /
                    (controller.appServices.sharedPreferences
                                .getString("lang") ==
                            "ar"
                        ? 2
                        : 2.8),
                height: Get.width / 2,
                AppImageAsset.iphone,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
