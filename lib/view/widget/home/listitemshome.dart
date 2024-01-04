import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/home_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/data/model/items_model.dart';
import 'package:rimzone_shop/view/widget/home/customfavoritebutton.dart';
import 'package:rimzone_shop/view/widget/shared/customimagecontainer.dart';
import 'package:rimzone_shop/view/widget/home/customitemsnameandeval.dart';

class ListItemsHome extends GetView<HomeControllerImplement> {
  final void Function()? onTapItems;
  const ListItemsHome({required this.onTapItems, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding:
          controller.appServices.sharedPreferences.getString("lang") == "ar"
              ? const EdgeInsets.only(right: 15.0)
              : const EdgeInsets.only(left: 15.0),
      scrollDirection: Axis.horizontal,
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        return ItemsHome(
          itemsModel: ItemsModel.fromJson(controller.items[index]),
          onTapItems: onTapItems,
          index: index,
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: 10.0),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImplement> {
  final ItemsModel itemsModel;
  final void Function()? onTapItems;
  final int index;
  const ItemsHome({
    super.key,
    required this.itemsModel,
    this.onTapItems,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetails(itemsModel);
      },
      child: Material(
        color: AppColor.secondColor,
        elevation: 0.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomItemsImage(
              lang: controller.appServices.sharedPreferences.getString("lang"),
              hero: controller.hero,
              itemsDiscount: itemsModel.itemsDiscount,
              itemsId: itemsModel.itemsId,
              itemsImage: itemsModel.itemsImage,
              fontWeight: FontWeight.bold,
            ),
            CustomHomeItemsNameAndEval(itemsModel: itemsModel),
            SizedBox(
              width: Get.width / (2.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemsModel.itemsDiscount == 0
                        ? "${itemsModel.itemsPrice}€"
                        : "${itemsModel.itemsPriceDiscount}€",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColor.blackColor,
                    ),
                  ),
                  CustomFavoriteButtonItemsHome(itemsModel: itemsModel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
