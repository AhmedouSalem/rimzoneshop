import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/itemsdetails_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomBottomNavBarItemsDetails extends StatelessWidget {
  const CustomBottomNavBarItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsDetailsControllerImplement>(
      builder: (controller) => Container(
        margin: const EdgeInsets.all(10.0),
        height: 70.0,
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10.0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColor.grey300),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      "${controller.model.itemsPrice}€",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize:
                              controller.model.itemsDiscount != 0 ? 16.0 : 20,
                          color: controller.model.itemsDiscount != 0
                              ? null
                              : AppColor.blackColor,
                          decoration: controller.model.itemsDiscount != 0
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationThickness: 1.5),
                    ),
                  ),
                  if (controller.model.itemsDiscount != 0)
                    Expanded(
                      child: Text(
                        "${controller.model.itemsPriceDiscount}€",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 45.0,
                child: MaterialButton(
                  disabledColor: const Color.fromRGBO(2, 101, 255, 0.5),
                  elevation: 0.0,
                  highlightElevation: 0.0,
                  color: AppColor.primaryColor,
                  onPressed: controller.disabled
                      ? null
                      : () {
                          controller
                              .addToCart(controller.model.itemsId.toString());
                        },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: controller.isLoading
                      ? const CircularProgressIndicator(
                          backgroundColor: AppColor.secondColor,
                        )
                      : Text(
                          "addToCart".tr,
                          style: const TextStyle(color: AppColor.secondColor),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
