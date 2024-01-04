import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/favorite_controller.dart';
import 'package:rimzone_shop/controller/itemsdetails_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomTopButtonItemsDetails
    extends GetView<ItemsDetailsControllerImplement> {
  const CustomTopButtonItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GetBuilder<ItemsDetailsControllerImplement>(
          builder: (controller) => MaterialButton(
            elevation: 0.0,
            highlightElevation: 0.0,
            color: AppColor.secondColor,
            shape: const CircleBorder(),
            height: 50.0,
            onPressed: () {
              Get.back();
            },
            child: Icon(
              controller.lang == "ar"
                  ? Icons.keyboard_arrow_right_outlined
                  : Icons.keyboard_arrow_left_outlined,
              size: 40.0,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GetBuilder<FavoriteController>(
              builder: (favController) => MaterialButton(
                elevation: 0.0,
                highlightElevation: 0.0,
                color: AppColor.secondColor,
                shape: const CircleBorder(),
                height: 50.0,
                onPressed: () {
                  controller.setFavorite(controller.model.itemsId.toString());
                },
                child: Icon(
                  favController.isFavorite[
                              controller.model.itemsId.toString()] ==
                          1
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: AppColor.redColor,
                ),
              ),
            ),
            MaterialButton(
              elevation: 0.0,
              highlightElevation: 0.0,
              color: AppColor.secondColor,
              shape: const CircleBorder(),
              height: 50.0,
              onPressed: () {},
              child: const Icon(Icons.ios_share_outlined),
            ),
          ],
        )
      ],
    );
  }
}
