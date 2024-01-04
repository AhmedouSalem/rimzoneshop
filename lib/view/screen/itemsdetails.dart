import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/itemsdetails_controller.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/itemsdetails/custombottomnavbar.dart';
import 'package:rimzone_shop/view/widget/itemsdetails/custombottomsheet.dart';
import 'package:rimzone_shop/view/widget/itemsdetails/customtopaction.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImplement controller =
        Get.put(ItemsDetailsControllerImplement());
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBarItemsDetails(),
      backgroundColor: AppColor.secondColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColor.bluGrey50,
            width: double.infinity,
            height: Get.width,
          ),
          Container(
            margin: const EdgeInsets.only(top: 35.0),
            child: const CustomTopButtonItemsDetails(),
          ),
          Positioned(
            left: 40.0,
            right: 40.0,
            bottom: Get.height / 1.9,
            child: Hero(
              tag: "${controller.model.itemsId}_${controller.hero}",
              child: CachedNetworkImage(
                imageUrl:
                    "${AppApiLinks.imageItems}/${controller.model.itemsImage}",
                height: Get.width / 1.9,
                fit: BoxFit.contain,
              ),
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.8,
            initialChildSize: 0.5,
            minChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return CustomBottomSheetItemsDetails(
                scrollController: scrollController,
              );
            },
          ),
        ],
      ),
    );
  }
}
