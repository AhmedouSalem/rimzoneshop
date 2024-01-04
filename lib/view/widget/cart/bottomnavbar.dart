import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rimzone_shop/controller/cart_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/view/widget/cart/buttoncheckout.dart';
import 'package:rimzone_shop/view/widget/cart/titleandindex.dart';

class CustomNavBarCart extends StatelessWidget {
  const CustomNavBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImplement>(
      builder: (controller) => Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      enabled: controller.couponName != null ||
                              controller.cartList.isEmpty
                          ? false
                          : true,
                      controller: controller.couponController,
                      decoration: InputDecoration(
                        suffix: InkWell(
                          onTap:
                              // controller.couponName == null ||
                              controller.couponController.text.trim().isNotEmpty
                                  // ||
                                  // controller.cartList.isNotEmpty
                                  ? () {
                                      controller.checkCoupon();
                                    }
                                  : null,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                controller.couponName == null
                                    ? "applyPromoCode".tr
                                    : "promoCodeApplied".tr,
                                style: TextStyle(
                                  color: controller.couponName == null
                                      ? null
                                      : AppColor.primaryColor,
                                ),
                              ),
                              Icon(
                                controller.couponName == null
                                    ? Icons.check_box_outline_blank_rounded
                                    : Icons.check_circle_rounded,
                                color: controller.couponName == null
                                    ? null
                                    : AppColor.primaryColor,
                              ),
                            ],
                          ),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        hintText: "couponName".tr,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height:
                          controller.isOpenKeyboard ? Get.width / 1.5 : 10.0,
                    ),
                    CustomTitleAndIndex(
                      title: "${"subTotal".tr} :",
                      index: "${controller.sumPrice}€",
                    ),
                    CustomTitleAndIndex(
                      title: "${"deliveryFee".tr} :",
                      index: "5.00€",
                    ),
                    CustomTitleAndIndex(
                      title: "${"discount".tr} :",
                      index: "${controller.couponDiscount}%",
                    ),
                  ],
                ),
              ),
              const Divider(),
              const CustomButtonCheckOutCart(),
            ],
          ),
          if (controller.isLoading)
            Lottie.asset(AppImageAsset.lottieLoading,
                width: 150.0, height: 150.0),
        ],
      ),
    );
  }
}
