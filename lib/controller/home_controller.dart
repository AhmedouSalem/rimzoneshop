import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/favorite_controller.dart';
// import 'package:rimzone_shop/controller/settings_controller.dart';
// import 'package:rimzone_shop/controller/viewfavorite_controller.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/home_data.dart';
import 'package:rimzone_shop/data/model/items_model.dart';

abstract class HomeController extends GetxController {
  getData();
  goToItems(String categoriesId, dynamic selectedIndex);
  goToItemsDetails(ItemsModel itemsModel);
}

class HomeControllerImplement extends HomeController {
  late ScrollController scrollController;
  late String hero;
  int currentItems = 0;
  int? currentFavoriteItems;
  AppServices appServices = Get.find();
  String? usersID;
  HomeData homeData = HomeData(Get.find<Crud>());
  List categories = [];
  List items = [];
  List favorite = [];
  int countCartItems = 0;
  List getItemsName = [];
  StatusRequest statusRequest = StatusRequest.none;
  double number = 2.5;
  IconData iconFavorite = Icons.favorite_border_outlined;
  FavoriteController favoriteController = Get.find();

  @override
  void onInit() {
    // appServices.sharedPreferences.clear();
    usersID = appServices.sharedPreferences.getString("users_id");
    hero = "home";
    getData();
    // if (!ViewFavoriteControllerImplement().isClosed &&
    //     !SettingsControllerImplement().isClosed) {
    //   Get.delete<ViewFavoriteControllerImplement>();
    //   Get.delete<SettingsControllerImplement>();
    // }
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    super.onInit();
  }

  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.minScrollExtent) {
      // appServices.sharedPreferences.clear();
      items.clear();
      categories.clear();
      favorite.clear();
      getData();
      update();
    }
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getDataHome(
      usersID,
    );
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        categories.addAll(response["categories"]);
        items.addAll(response["itemsDiscount"]);
        countCartItems = int.parse(response["countCartItems"]);
        getItemsName.addAll(response["getItemsName"]);
        for (var element in items) {
          favoriteController.setFavorite(
              element['items_id'].toString(), element['favorite']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  onChangeCountCartItems(int val) {
    countCartItems = val;
    update();
  }

  @override
  goToItems(categoriesId, selectedIndex) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "categoriesId": categoriesId,
      "selectedIndex": selectedIndex,
    });
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
}
