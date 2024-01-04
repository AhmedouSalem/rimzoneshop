import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/cart_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomButtonCheckOutCart extends StatelessWidget {
  const CustomButtonCheckOutCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: GetBuilder<CartControllerImplement>(
        builder: (controller) => MaterialButton(
          disabledColor: AppColor.primaryColor.withOpacity(0.1),
          elevation: 0.0,
          highlightElevation: 0.0,
          color: AppColor.primaryColor,
          onPressed: controller.isLoading
              ? null
              : () {
                  controller.goToCheckOut();
                },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${"checkoutFor".tr}  ",
                style: const TextStyle(
                  color: AppColor.secondColor,
                ),
              ),
              GetBuilder<CartControllerImplement>(
                builder: (cartController) => Text(
                  "${cartController.getTotalPrice() + 5.00}€",
                  style: const TextStyle(
                    color: AppColor.secondColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
