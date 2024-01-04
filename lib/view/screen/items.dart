import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/favorite_controller.dart';
import 'package:rimzone_shop/controller/items_controller.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/view/widget/defaulthomepage/customheader.dart';
import 'package:rimzone_shop/view/widget/home/customsearchtextform.dart';
import 'package:rimzone_shop/view/widget/items/listcategoriesitems.dart';
import 'package:rimzone_shop/view/widget/items/listitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    ItemsControllerImplement controller = Get.put(ItemsControllerImplement());
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 35.0),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6.5),
                child: CustomHeaderDefault(
                  leading: Container(
                    alignment: controller.lang == "ar"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30.0,
                      ),
                    ),
                  ),
                  onPressedCart: () {
                    Get.toNamed(AppRoutes.cart);
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomTextFormSearchHome(title: "Search".tr),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      height: 40,
                      child: const ListCategoriesItems(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomListItems(items: controller.items),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
