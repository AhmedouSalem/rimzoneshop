import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/favorite_controller.dart';
import 'package:rimzone_shop/controller/home_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/data/model/items_model.dart';

class CustomFavoriteButtonSearch extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomFavoriteButtonSearch({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    HomeControllerImplement controller = Get.find();
    return GetBuilder<FavoriteController>(
      builder: (favController) => InkWell(
        onTap: () {
          controller.setFavorite(itemsModel.itemsId.toString());
        },
        child: Container(
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: Icon(
            favController.isFavorite[itemsModel.itemsId.toString()] == 0
                ? Icons.favorite_border_outlined
                : Icons.favorite,
            color: AppColor.redColor,
          ),
        ),
      ),
    );
  }
}
