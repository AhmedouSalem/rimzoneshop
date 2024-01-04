import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/favorite_controller.dart';
import 'package:rimzone_shop/controller/home_controller.dart';
import 'package:rimzone_shop/core/class/handlingdataview.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';
import 'package:rimzone_shop/view/widget/home/customcard.dart';
import 'package:rimzone_shop/view/widget/defaulthomepage/customheader.dart';
import 'package:rimzone_shop/view/widget/home/customsearchtextform.dart';
import 'package:rimzone_shop/view/widget/home/customsectiontitle.dart';
import 'package:rimzone_shop/view/widget/home/listcategories.dart';
import 'package:rimzone_shop/view/widget/home/listitemshome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    Get.put(HomeControllerImplement());
    return SafeArea(
      minimum: const EdgeInsets.only(top: 35.0),
      child: GetBuilder<HomeControllerImplement>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              CustomHeaderDefault(
                leading: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    alignment: controller.appServices.sharedPreferences
                                .getString("lang") ==
                            "ar"
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: CustomTitleText(title: "Discover".tr),
                  ),
                ),
                onPressedCart: () {
                  Get.toNamed(AppRoutes.cart);
                },
              ),
              Expanded(
                child: ListView(
                  controller: controller.scrollController,
                  key: const PageStorageKey<String>("offers"),
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomTextFormSearchHome(title: "Search".tr),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomCardHome(),
                    ),
                    CustomSectionTitleHome(
                      title: "Categories".tr,
                      onTap: () {
                        controller.goToItems("All", "All");
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      height: 40,
                      child: const ListCategoriesHome(),
                    ),
                    CustomSectionTitleHome(
                      title: "Offer".tr,
                      onTap: () {},
                    ),
                    Container(
                      height: 260.0,
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: ListItemsHome(onTapItems: () {}),
                    ),
                    const SizedBox(
                      height: 500.0,
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
