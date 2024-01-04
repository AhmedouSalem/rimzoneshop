import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/viewfavorite_controller.dart';
import 'package:rimzone_shop/core/class/handlingdataview.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/data/model/favorite_model.dart';
import 'package:rimzone_shop/view/widget/favorite/listfavoriteitems.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';

class FavoriteDefaultHomePage extends StatelessWidget {
  const FavoriteDefaultHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewFavoriteControllerImplement());
    return SafeArea(
      minimum: const EdgeInsets.only(top: 35.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTitleText(title: "myFavorite".tr),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_control,
                      size: 35.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<ViewFavoriteControllerImplement>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColor.grey300,
                      thickness: 1.7,
                      height: 20.0,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    itemCount: controller.itemsFavorite.length,
                    itemBuilder: (context, index) {
                      return ListFavoriteItems(
                        favoriteModel: FavoriteModel.fromJson(
                          controller.itemsFavorite[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
