import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/favorite_controller.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/items_data.dart';
import 'package:rimzone_shop/data/model/items_model.dart';

abstract class ItemsController extends GetxController {
  initialData(dynamic initialIndex);
  onPageChanged(dynamic index, String catID);
  getItems(String? catID);
  goToItemsDetails(ItemsModel itemsModel);
}

class ItemsControllerImplement extends ItemsController {
  dynamic currentIndex = 0;
  late String hero;
  AppServices appServices = Get.find();
  String? lang;
  late List categories;
  late String categoriesId;
  List items = [];
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find<Crud>());
  FavoriteController favoriteController = Get.find();

  @override
  void onInit() {
    categoriesId = Get.arguments["categoriesId"];
    lang = appServices.sharedPreferences.getString("lang");
    categories = Get.arguments["categories"];
    initialData(Get.arguments["selectedIndex"]);
    getItems(categoriesId);
    hero = "items";
    super.onInit();
  }

  setFavorite(String itemsID) {
    if (favoriteController.isFavorite[itemsID] == 0) {
      favoriteController.setFavorite(
        itemsID,
        1,
      );
      favoriteController.addFavorite(
        itemsID,
      );
    } else {
      favoriteController.setFavorite(
        itemsID,
        0,
      );
      favoriteController.removeFavorite(
        itemsID,
      );
    }
    update();
  }

  @override
  getItems(catID) async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getDataItems(
        catID, appServices.sharedPreferences.getString("users_id"));
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        items.addAll(response["items"]);
        for (var element in items) {
          favoriteController.setFavorite(
              element["items_id"].toString(), element['favorite']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initialData(initialIndex) {
    currentIndex = initialIndex;
    update();
  }

  @override
  onPageChanged(index, catID) {
    items.clear();
    currentIndex = index;
    update();
    getItems(catID);
  }

  @override
  goToItemsDetails(itemsModel) {
    Get.toNamed(
      AppRoutes.itemsDetails,
      arguments: {
        "itemsModel": itemsModel,
        "hero": hero,
      },
    );
  }

  Color? getItemColor(bool isSelected, bool isBorder) {
    if (isBorder) {
      return isSelected ? AppColor.primaryColor : AppColor.blackColor;
    }
    return isSelected ? AppColor.primaryColor : null;
  }

  Color? getItemTextStyle(bool isSelected) {
    return isSelected ? AppColor.secondColor : null;
  }
}
