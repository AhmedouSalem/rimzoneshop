import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/cart_controller.dart';
import 'package:rimzone_shop/core/class/handlingdataview.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/data/model/cart_model.dart';
import 'package:rimzone_shop/view/widget/cart/bottomnavbar.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';
import 'package:rimzone_shop/view/widget/cart/listitemscart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImplement());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const CustomNavBarCart(),
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 35.0),
        child: GetBuilder<CartControllerImplement>(
          builder: (controller) => SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 35.0,
                      ),
                    ),
                    CustomTitleText(title: "myCart".tr),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_control,
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(
                        color: AppColor.grey300,
                        thickness: 1.7,
                        height: 20.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 15.0,
                      ),
                      itemCount: controller.cartList.length,
                      itemBuilder: (context, index) {
                        return ListCartItems(
                          cartModel: CartModel.fromJson(
                            controller.cartList[index],
                          ),
                          count: controller.cartList[index]
                              ['countItemsQuantity'],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
