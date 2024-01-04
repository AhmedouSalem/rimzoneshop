import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/orders/orders_details_controller.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/functions/translatedatabase.dart';
import 'package:rimzone_shop/data/model/orders_details_model.dart';

class CustomItemsOrdersList extends GetView<OrdersDetailsControllerImplement> {
  const CustomItemsOrdersList({super.key, required this.ordersDetailsModel});
  final OrdersDetailsModel ordersDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: Get.width / 4.3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: Get.width / 5.0,
            height: Get.width / 5.0,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColor.secondColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  "${AppApiLinks.imageItems}/${ordersDetailsModel.itemsImage}",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 3.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${translateDatabase(ordersDetailsModel.itemsNameAr, ordersDetailsModel.itemsNameEn, ordersDetailsModel.itemsNameFr)}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: controller.lang == "ar" ? 12.0 : null,
                  ),
                ),
                Text(
                  "${"Quantity".tr}: ${ordersDetailsModel.itemsOrderQuantity}",
                  style: TextStyle(
                    fontSize: controller.lang == "ar" ? 12.0 : null,
                  ),
                ),
                Text(
                  "${ordersDetailsModel.itemsOrderPrice}€",
                  style: TextStyle(
                    fontSize: controller.lang == "ar" ? 12.0 : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
