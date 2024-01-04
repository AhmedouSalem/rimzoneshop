import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/items_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/functions/translatedatabase.dart';
import 'package:rimzone_shop/data/model/items_model.dart';

class CustomItemsNameAndEval extends GetView<ItemsControllerImplement> {
  final ItemsModel itemsModel;
  const CustomItemsNameAndEval({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / (2.5),
      height: Get.width / 20.1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsNameEn, itemsModel.itemsNameFr)}",
              style: controller.lang == "ar"
                  ? const TextStyle(fontSize: 12.0)
                  : null,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star_outlined,
                color: AppColor.yellowAccentShade700,
                size: 15.0,
              ),
              Text(
                "5.6",
                style: controller.lang == "ar"
                    ? const TextStyle(fontSize: 12.0)
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
