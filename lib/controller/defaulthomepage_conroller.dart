import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/viewfavorite_controller.dart';
import 'package:rimzone_shop/view/screen/favorites.dart';
import 'package:rimzone_shop/view/screen/home.dart';
import 'package:rimzone_shop/view/screen/notificationspush.dart';
import 'package:rimzone_shop/view/screen/settings.dart';

abstract class DefaultHomePageController extends GetxController {
  onPageChanged(int index);
}

class DefaultHomePageControllerImplement extends DefaultHomePageController {
  int currentPage = 0;
  List<Widget> pageList = [
    const Home(),
    const NotificationsDefaultHomePage(),
    const FavoriteDefaultHomePage(),
    const SettingsDefaultHomePage(),
  ];
  List<IconData> iconDataList = [
    Icons.home_outlined,
    Icons.notifications_outlined,
    Icons.favorite_outlined,
    Icons.settings_outlined,
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  onPageChanged(index) {
    currentPage = index;
    update();
    if (index == 2 && Get.isRegistered<ViewFavoriteControllerImplement>()) {
      ViewFavoriteControllerImplement controller = Get.find();
      controller.itemsFavorite.isEmpty
          ? controller.getFavoriteItems(true)
          : controller.getFavoriteItems(false);
    }
  }
}
