import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/home_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomHeaderDefault extends StatelessWidget {
  final Widget leading;
  final void Function()? onPressedCart;
  const CustomHeaderDefault(
      {super.key, required this.leading, this.onPressedCart});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImplement>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: leading,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: controller.appServices.sharedPreferences
                              .getString("lang") ==
                          "ar"
                      ? 0.0
                      : 8.0,
                  left: controller.appServices.sharedPreferences
                              .getString("lang") ==
                          "ar"
                      ? 8.0
                      : 0.0,
                ),
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1, color: AppColor.grey300),
                ),
                child: IconButton(
                  onPressed: onPressedCart,
                  icon: const Icon(Icons.shopping_cart_outlined),
                  color: AppColor.blackColor,
                  iconSize: 20.0,
                ),
              ),
              Positioned(
                top: -0.1,
                right: controller.appServices.sharedPreferences
                            .getString("lang") ==
                        "ar"
                    ? null
                    : 5.0,
                left: controller.appServices.sharedPreferences
                            .getString("lang") ==
                        "ar"
                    ? 5.0
                    : null,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: GetBuilder<HomeControllerImplement>(
                      builder: (controller) => Text(
                        textAlign: TextAlign.center,
                        "${controller.countCartItems}",
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: AppColor.secondColor,
                          fontFamily: "Cairo",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
