import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/home_controller.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/cart_data.dart';
import 'package:rimzone_shop/data/model/coupon_model.dart';

abstract class CartController extends GetxController {
  getItemsCart();
  removeItemFromCart(String itemsID);
  incrementItemsQuantity(String itemsID);
  decrementItemQuantity(String itemsID);
  goToCheckOut();
}

class CartControllerImplement extends CartController {
  List cartList = [];
  bool isLoading = false;
  String? lang;
  late String usersID;
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find<Crud>());
  HomeControllerImplement homeControllerImplement = Get.find();
  AppServices appServices = Get.find();
  late String hero;
  dynamic sumPrice = 0.00;
  int couponDiscount = 0;
  String? couponName;
  int? couponId;
  late TextEditingController couponController;
  CouponModel? couponModel;
  late KeyboardVisibilityController keyboardVisibilityController;
  bool isOpenKeyboard = false;

  @override
  void onInit() {
    lang = appServices.sharedPreferences.getString("lang");
    couponController = TextEditingController();
    keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((bool visible) {
      isOpenKeyboard = visible;
      update();
    });
    hero = "cart";
    usersID = appServices.sharedPreferences.getString("users_id")!;
    getItemsCart();
    super.onInit();
  }

  @override
  void dispose() {
    couponController.dispose();
    super.dispose();
  }

  @override
  getItemsCart() async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getDataCart(
      usersID,
    );
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        cartList.addAll(response["data"]);
        for (var element in cartList) {
          sumPrice += element["itemsQuantityPrice"];
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeItemFromCart(itemsID) {
    sumPrice = 0;
    dynamic countItemsQuantity = 0;
    cartData.removeItemFromCart(
      usersID,
      itemsID,
    );
    cartList
        .removeWhere((element) => element['cart_items'].toString() == itemsID);
    for (var element in cartList) {
      sumPrice += element["itemsQuantityPrice"];
      countItemsQuantity += element["countItemsQuantity"];
    }
    homeControllerImplement.onChangeCountCartItems(countItemsQuantity);
    couponName = null;
    couponDiscount = 0;
    update();
  }

  @override
  decrementItemQuantity(String itemsID) {
    cartData.decrementItemQuantity(
      usersID,
      itemsID,
    );
    for (var element in cartList) {
      if (element['cart_items'].toString() == itemsID) {
        if (element['countItemsQuantity'] > 1) {
          element['countItemsQuantity'] = element['countItemsQuantity'] - 1;
          sumPrice -= element['items_price'] -
              (element['items_price'] * element['items_discount'] / 100);
        }
      }
    }
    homeControllerImplement
        .onChangeCountCartItems(homeControllerImplement.countCartItems -= 1);
    couponName = null;
    couponDiscount = 0;
    update();
  }

  @override
  incrementItemsQuantity(String itemsID) async {
    cartData.incrementItemQuantity(
      usersID,
      itemsID,
    );
    for (var element in cartList) {
      if (element['cart_items'].toString() == itemsID) {
        element['countItemsQuantity'] =
            (element['countItemsQuantity'] ?? 0) + 1;
        sumPrice += element['items_price'] -
            (element['items_price'] * element['items_discount'] / 100);
      }
    }
    homeControllerImplement
        .onChangeCountCartItems(homeControllerImplement.countCartItems += 1);
    couponName = null;
    couponDiscount = 0;

    update();
  }

  double getTotalPrice() {
    double totalPrice = sumPrice - (sumPrice * couponDiscount / 100);
    return double.parse(totalPrice.toStringAsFixed(2));
  }

  checkCoupon() async {
    isLoading = true;
    update();
    var response = await cartData.checkCoupon(
      couponController.text.trim(),
    );
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      isLoading = false;
      if (response["status"] == "success") {
        couponModel = CouponModel.fromJson(response["data"]);
        couponDiscount = couponModel!.couponDiscount!;
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId;
      } else {
        couponName = null;
        couponDiscount = 0;
        couponId = null;
        Get.rawSnackbar(message: "couponNotValid".tr);
      }
    }
    update();
  }

  @override
  goToCheckOut() {
    if (cartList.isEmpty) {
      return Get.rawSnackbar(message: "cartEmpty".tr);
    }
    dynamic countItemsQuantity = 0;
    List<Map<String, dynamic>> itemsOrder = [];
    cartList.forEach((element) {
      itemsOrder.add({
        "items_id": element["items_id"],
        "items_quantity": element["countItemsQuantity"],
        "items_prices": element["itemsQuantityPrice"],
      });
    });
    cartList.forEach((element) {
      countItemsQuantity += element["countItemsQuantity"]!;
    });
    Get.toNamed(AppRoutes.checkOut, arguments: {
      "subtotal": sumPrice,
      "priceDelivery": 5.00,
      "couponId": couponId ?? 0,
      "totalPrice": getTotalPrice(),
      "couponDiscount": couponDiscount,
      "countItemsQuantity": countItemsQuantity,
      "itemsOrder": itemsOrder,
    });
  }
}
