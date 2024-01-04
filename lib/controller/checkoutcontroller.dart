import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/address_data.dart';
import 'package:rimzone_shop/data/datasource/remote/checkout_data.dart';
import 'package:rimzone_shop/data/model/address_model.dart';
import 'package:rimzone_shop/view/screen/defaulthomepage.dart';

abstract class CheckOutController extends GetxController {
  // general
  animateToPageIndexIncrement();
  animateToPageIndexDecrement();
  willBack();
  // Shipping
  addAddress();
  viewAddress();
  deleteAddress(String addressID);
  insertAddressDetails();
  chooseAddress(int index);
  chooseDeliveryType(String index, String image);
  closeDialog();
  willBackOnCloseDialog();
  // Payment
  choosePaymentMethod(int index, String image);
  // sendOrder();
}

class CheckOutControllerImplement extends CheckOutController {
  // get argument previous route
  late List<Map<String, dynamic>> itemsOrder;
  late dynamic subtotal;
  late dynamic priceDelivery;
  late int couponId;
  late double totalPrice;
  late int countItemsQuantity;
  late int couponDiscount;
  // end argument previous route
  late PageController pageController;
  int initialPage = 0;
  // Start shipping page variable
  bool isLoading = false;
  late List<TextEditingController> addressFormField;
  AddressData addressData = AddressData(Get.find<Crud>());
  List<AddressModel> listAddress = [];
  List<String> labelTextAddress = [
    "Name".tr,
    "City".tr,
    "Street".tr,
  ];
  List<bool> isAutoFocus = [
    false,
    false,
    false,
  ];
  bool completed = false;
  int? addressId;
  Map<String, dynamic>? address = {};
  String? deliveryType;
  String? lang;
  AppServices appServices = Get.find();
  String? usersID;
  StatusRequest statusRequest = StatusRequest.none;
  late Completer<GoogleMapController> completer;
  late Position position;
  CameraPosition kGooglePlex =
      const CameraPosition(target: LatLng(18.0786727, -15.9746168));
  List<Marker> markers = [];
  late double lat;
  late double long;
  // End Shipping page variable
  // Start Payment
  int? paymentMethodId;
  CheckoutData checkoutData = CheckoutData(Get.find<Crud>());
  bool isConfirmed = false;
  // Reviews
  String? iconDeliveryType;
  String? iconPaymentType;
  @override
  void onInit() {
    lang = appServices.sharedPreferences.getString("lang");
    usersID = appServices.sharedPreferences.getString("users_id");
    itemsOrder = Get.arguments["itemsOrder"];
    print(jsonEncode(itemsOrder));
    subtotal = Get.arguments["subtotal"];
    priceDelivery = Get.arguments["priceDelivery"];
    couponId = Get.arguments["couponId"];
    totalPrice = Get.arguments["totalPrice"];
    countItemsQuantity = Get.arguments["countItemsQuantity"];
    couponDiscount = Get.arguments["couponDiscount"];
    addressFormField = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    completer = Completer<GoogleMapController>();
    pageController = PageController();
    // getCurrentPosition();
    viewAddress();
    super.onInit();
  }

  @override
  void dispose() {
    for (var element in addressFormField) {
      element.dispose();
    }
    super.dispose();
  }

  getCurrentPosition() async {
    statusRequest = StatusRequest.loading;
    position = await Geolocator.getCurrentPosition();
    lat = position.latitude;
    long = position.longitude;
    kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  bool isOpenMaps = false;
  checkOpenMap() async {
    isOpenMaps = true;
    update();
  }

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: latLng,
      ),
    );
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  @override
  insertAddressDetails() {
    completed = true;
    update();
  }

  onTapField(int index) {
    for (int i = 0; i < isAutoFocus.length; i++) {
      if (i == index) {
        isAutoFocus[i] = true;
      } else {
        isAutoFocus[i] = false;
      }
    }
    update();
  }

  @override
  addAddress() async {
    if (addressFormField[0].text.isNotEmpty &&
        addressFormField[1].text.trim().isNotEmpty &&
        addressFormField[2].text.trim().isNotEmpty) {
      isLoading = true;
      update();
      var response = await addressData.addAddress(
        usersID!,
        addressFormField[0].text.trim().trim(),
        addressFormField[1].text.trim().trim(),
        addressFormField[2].text.trim().trim(),
        lat.toString(),
        long.toString(),
      );
      statusRequest = await handlingData(response);
      print(statusRequest);
      if (StatusRequest.success == statusRequest) {
        isLoading = false;
        if (response["status"] == "success") {
          Get.back();
          listAddress.clear();
          viewAddress();
          closeDialog();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      return Get.rawSnackbar(message: "enterDataAddress".tr);
    }
  }

  @override
  viewAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewAddress(usersID!);
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List data = response["data"];
        listAddress.addAll(data.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteAddress(addressID) {
    addressData.deleteAddress(addressID);
    listAddress
        .removeWhere((element) => element.addressId == int.parse(addressID));
    update();
  }

  @override
  chooseAddress(int index) {
    address!.clear();
    addressId = index;
    listAddress.forEach((element) {
      if (element.addressId == index) {
        address!["addressName"] = element.addressName;
        address!["addressCompleted"] =
            "${element.addressCity},${element.addressStreet}";
      }
    });
    update();
  }

  @override
  closeDialog() {
    markers.clear();
    completed = false;
    update();
    for (var element in addressFormField) {
      element.text = "";
    }
  }

  @override
  Future<bool> willBackOnCloseDialog() async {
    completed = false;
    update();
    for (var element in addressFormField) {
      element.text = "";
    }
    return Future.value(true);
  }

  @override
  Future<bool> willBack() async {
    if (initialPage > 0) {
      if (initialPage == 2) {
        exit(0);
      }
      initialPage--;
      await pageController.animateToPage(
        initialPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      update();
      return Future.value(false);
    } else {
      Get.back();
      return Future.value(true);
    }
  }

  @override
  chooseDeliveryType(index, image) {
    deliveryType = index;
    iconDeliveryType = image;
    update();
  }

  @override
  animateToPageIndexIncrement() async {
    if (initialPage == 2) {
      Get.offAll(
        () => const DefaultHomePage(),
        routeName: AppRoutes.homeScreen,
        transition: Transition.noTransition,
      );
    }
    if (addressId == null && deliveryType == "1") {
      return Get.rawSnackbar(message: "pleaseChooseAddress".tr);
    }
    if (deliveryType == null) {
      return Get.rawSnackbar(message: "pleaseChooseDeliveryType".tr);
    }
    if (initialPage == 1) {
      if (paymentMethodId == null) {
        return Get.rawSnackbar(message: "pleaseChoosePaymentMethod".tr);
      } else {
        isConfirmed = true;
        update();
        var response = await checkoutData.sendOrder(
          usersID!,
          deliveryType == "0" ? "1" : addressId.toString(),
          couponId.toString(),
          subtotal.toString(),
          priceDelivery.toString(),
          paymentMethodId.toString(),
          itemsOrder,
        );
        statusRequest = await handlingData(response);
        print(statusRequest);
        if (StatusRequest.success == statusRequest) {
          isConfirmed = false;
          update();
          if (response["status"] == "success") {
            initialPage++;
            pageController.animateToPage(
              initialPage,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          } else {
            return Get.rawSnackbar(message: "tryAgain".tr);
          }
        } else {
          return Get.rawSnackbar(message: "tryAgain".tr);
        }
        update();
      }
    }
    if (initialPage != 2) {
      initialPage++;
      pageController.animateToPage(
        initialPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      update();
    }
    print(initialPage);
  }

  @override
  animateToPageIndexDecrement() {
    if (initialPage > 0) {
      initialPage--;
      pageController.animateToPage(
        initialPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      update();
    } else {
      Get.back();
    }
  }

  @override
  choosePaymentMethod(index, image) {
    paymentMethodId = index;
    iconPaymentType = image;
    update();
  }

  String buttonText() {
    if (initialPage == 0) {
      return "Next".tr;
    } else if (initialPage == 1) {
      return "Confirm".tr;
    } else {
      return "terminate".tr;
    }
  }

  // @override
  // sendOrder() async {
  //   isConfirmed = true;
  //   update();
  //   var response = await checkoutData.sendOrder(
  //     usersID!,
  //     addressId.toString(),
  //     couponId.toString(),
  //     subtotal,
  //     priceDelivery,
  //     paymentMethodId.toString(),
  //     itemsOrder,
  //   );
  //   statusRequest = await handlingData(response);
  //   print(statusRequest);
  //   if (StatusRequest.success == statusRequest) {
  //     isConfirmed = false;
  //     if (response["status"] == "success") {
  //     } else {
  //       return Get.rawSnackbar(message: "tryAgain".tr);
  //     }
  //   }
  //   update();
  // }
}
