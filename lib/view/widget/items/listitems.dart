import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/items_controller.dart';
import 'package:rimzone_shop/core/class/handlingdataview.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/data/model/items_model.dart';
import 'package:rimzone_shop/view/widget/shared/customimagecontainer.dart';
import 'package:rimzone_shop/view/widget/items/customfavoritebutton.dart';
import 'package:rimzone_shop/view/widget/items/lineitemsnameandeval.dart';

class CustomListItems extends StatelessWidget {
  final List items;
  const CustomListItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImplement>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: Get.width / (Get.width * 1.35),
            crossAxisSpacing: Get.width / 25.5,
          ),
          itemBuilder: (context, index) {
            return ItemsItems(
              itemsModel: ItemsModel.fromJson(
                items[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemsItems extends GetView<ItemsControllerImplement> {
  final ItemsModel itemsModel;
  const ItemsItems({super.key, required this.itemsModel});

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
              lang: controller.lang,
              hero: controller.hero,
              itemsDiscount: itemsModel.itemsDiscount,
              itemsId: itemsModel.itemsId,
              itemsImage: itemsModel.itemsImage,
              fontWeight: FontWeight.bold,
            ),
            CustomItemsNameAndEval(itemsModel: itemsModel),
            SizedBox(
              width: Get.width / (2.5),
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
                  CustomFavoriteButton(itemsModel: itemsModel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
