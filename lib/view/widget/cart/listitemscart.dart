import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/cart_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/functions/translatedatabase.dart';
import 'package:rimzone_shop/data/model/cart_model.dart';
import 'package:rimzone_shop/view/widget/cart/buttonaddandremove.dart';
import 'package:rimzone_shop/view/widget/favorite/userevaluation.dart';
import 'package:rimzone_shop/view/widget/shared/customimagecontainer.dart';

class ListCartItems extends StatelessWidget {
  final CartModel cartModel;
  final int count;
  const ListCartItems(
      {super.key, required this.cartModel, required this.count});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImplement>(
      builder: (controller) => InkWell(
        onTap: () {},
        child: SizedBox(
          height: controller.lang == "ar" ? 115 : 100.0,
          child: Row(
            children: [
              Expanded(
                child: CustomItemsImage(
                  hero: controller.hero,
                  itemsDiscount: cartModel.itemsDiscount,
                  itemsId: cartModel.itemsId,
                  itemsImage: cartModel.itemsImage,
                  lang: '${controller.lang}',
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: controller.lang == "ar" ? 8.0 : 0.0,
                    left: controller.lang == "ar" ? 0.0 : 8.0,
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
                                cartModel.itemsNameAr,
                                cartModel.itemsNameEn,
                                cartModel.itemsNameFr,
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
                              controller.removeItemFromCart(
                                  cartModel.itemsId.toString());
                            },
                            child: const Icon(
                              Icons.highlight_remove,
                              color: AppColor.colorGrey,
                            ),
                          )
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Text(
                              "Color : white",
                            ),
                          ),
                          Expanded(
                            child: CustomUserEvaluationFavorite(
                              iconData: Icons.star,
                              value: "5.6",
                              iconColor: AppColor.yellowAccentShade700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${cartModel.itemsPrice - (cartModel.itemsPrice * cartModel.itemsDiscount / 100)}€",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 20.0,
                                height: 0.0,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: CustomButtonAddAndRemove(
                                    iconData: Icons.remove,
                                    onPressed: () {
                                      if (cartModel.countItemsQuantity! > 1) {
                                        controller.decrementItemQuantity(
                                            cartModel.itemsId.toString());
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Text(
                                      // "${cartModel.countItemsQuantity}",
                                      "$count",
                                      style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: CustomButtonAddAndRemove(
                                    iconData: Icons.add,
                                    onPressed: () {
                                      controller.incrementItemsQuantity(
                                          cartModel.itemsId.toString());
                                    },
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
