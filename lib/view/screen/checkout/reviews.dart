import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/checkoutcontroller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/checkout/customexpandtile.dart';

class CheckoutReviews extends StatelessWidget {
  const CheckoutReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GetBuilder<CheckOutControllerImplement>(
        builder: (controller) => ListView(
          shrinkWrap: true,
          children: [
            if (controller.deliveryType == '1')
              CustomExpandTileReviewsCheckout(
                leadingTitle: "${"shipTo".tr} : ",
                title: "${controller.address!["addressName"]}",
                body: "${controller.address!["addressCompleted"]}",
                leadingDetails: const Icon(
                  Icons.location_city_outlined,
                  color: AppColor.primaryColor,
                ),
              ),
            CustomExpandTileReviewsCheckout(
              leadingTitle: "${"delivery".tr} : ",
              title: controller.deliveryType == '0'
                  ? 'atStore'.tr
                  : 'standardDelivery'.tr,
              body: controller.deliveryType == '0'
                  ? 'onSpace'.tr
                  : 'atTheLocationSpecified'.tr,
              leadingDetails: Image.asset(
                controller.iconDeliveryType!,
                height: 25.0,
                width: 25.0,
                color: AppColor.primaryColor,
              ),
            ),
            CustomExpandTileReviewsCheckout(
              leadingTitle: "${"Payment".tr.toUpperCase()} : ",
              title:
                  controller.paymentMethodId == 1 ? 'cash'.tr : 'creditCard'.tr,
              body: controller.paymentMethodId == 1
                  ? '${"paymentMethod".tr} : ${"cash".tr} '
                  : '${"Payment".tr} ${"with".tr} ${"creditCard".tr}',
              leadingDetails: Image.asset(
                controller.iconPaymentType!,
                height: 25.0,
                width: 25.0,
                color: AppColor.primaryColor,
              ),
            ),
            CustomExpandTileReviewsCheckout(
              leadingTitle: "${"Quantity".tr} : ",
              title: "${"Product".tr} (${controller.countItemsQuantity})",
              body:
                  "${"youHaveOrdered".tr} ${controller.countItemsQuantity} ${"productInOrder".tr}",
              leadingDetails: const Icon(
                Icons.production_quantity_limits_outlined,
                color: AppColor.primaryColor,
              ),
            ),
            CustomExpandTileReviewsCheckout(
              leadingTitle: "${"subTotal".tr} : ",
              title: "",
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                            "${controller.countItemsQuantity}X ${"Product".tr}"),
                      ),
                      Expanded(child: Text("${controller.subtotal}€")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text("deliveryFee".tr)),
                      Expanded(child: Text("${controller.priceDelivery}€")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text("discount".tr)),
                      Expanded(child: Text("${controller.couponDiscount}%")),
                    ],
                  ),
                ],
              ),
              leadingDetails: const Icon(
                Icons.production_quantity_limits_outlined,
                color: AppColor.primaryColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${"total".tr} :"),
                Text("${controller.totalPrice + controller.priceDelivery}€")
              ],
            )
          ],
        ),
      ),
    );
  }
}
