import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/viewfavorite_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/functions/translatedatabase.dart';
import 'package:rimzone_shop/data/model/favorite_model.dart';
import 'package:rimzone_shop/view/widget/favorite/userevaluation.dart';
import 'package:rimzone_shop/view/widget/shared/customimagecontainer.dart';

class ListFavoriteItems extends GetView<ViewFavoriteControllerImplement> {
  final FavoriteModel favoriteModel;
  const ListFavoriteItems({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetails(favoriteModel);
      },
      child: SizedBox(
        height:
            controller.appServices.sharedPreferences.getString("lang") == "ar"
                ? 115
                : 100.0,
        child: Row(
          children: [
            Expanded(
              child: CustomItemsImage(
                lang:
                    controller.appServices.sharedPreferences.getString("lang"),
                hero: controller.hero,
                itemsDiscount: favoriteModel.itemsDiscount,
                itemsId: favoriteModel.itemsId,
                itemsImage: favoriteModel.itemsImage,
                fontWeight: null,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(
                  right: controller.appServices.sharedPreferences
                              .getString("lang") ==
                          "ar"
                      ? 8.0
                      : 0.0,
                  left: controller.appServices.sharedPreferences
                              .getString("lang") ==
                          "ar"
                      ? 0.0
                      : 8.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "${translateDatabase(
                              favoriteModel.itemsNameAr,
                              favoriteModel.itemsNameEn,
                              favoriteModel.itemsNameFr,
                            )}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 18.0,
                              height: 0.0,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.removeFavorite(
                                favoriteModel.itemsId.toString());
                          },
                          child: const Icon(
                            Icons.close_outlined,
                            color: AppColor.colorGrey,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          favoriteModel.itemsCount! > 0
                              ? "inStock".tr
                              : "notInStock".tr,
                          style: TextStyle(
                            color: favoriteModel.itemsCount! > 0
                                ? AppColor.primaryColor
                                : AppColor.redColor,
                          ),
                        ),
                        // Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: List.generate(
                        //     5,
                        //     (index) => const Icon(
                        //       Icons.star,
                        //       color: AppColor.yellowAccentShade700,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "${favoriteModel.itemsPrice}€",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: favoriteModel.itemsDiscount != 0
                                      ? 14.0
                                      : 20.0,
                                  height: 0.0,
                                  color: favoriteModel.itemsDiscount != 0
                                      ? null
                                      : AppColor.blackColor,
                                  decoration: favoriteModel.itemsDiscount != 0
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  decorationThickness: 1.5,
                                ),
                              ),
                              if (favoriteModel.itemsDiscount != 0)
                                Text(
                                  "${favoriteModel.itemsPriceDiscount}€",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    height: 0.0,
                                    color: AppColor.primaryColor,
                                  ),
                                )
                            ],
                          ),
                        ),
                        const Expanded(
                          child: CustomUserEvaluationFavorite(
                            iconData: Icons.thumb_up_alt_rounded,
                            value: "94",
                            iconColor: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
