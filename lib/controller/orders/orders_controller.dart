import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/checkout_data.dart';
import 'package:rimzone_shop/data/model/orders_model.dart';

abstract class OrdersController extends GetxController
    with GetSingleTickerProviderStateMixin {
  getOrders();
  deleteOrders(String ordersID);
  goToOrdersDetails(OrdersModel ordersModel);
}

class OrdersControllerImplement extends OrdersController {
  late TabController tabController;
  CheckoutData checkoutData = CheckoutData(Get.find<Crud>());
  StatusRequest statusRequest = StatusRequest.none;
  late String usersID;
  AppServices appServices = Get.find();
  late String lang;
  List<OrdersModel> pendingOrders = [];
  List<OrdersModel> archiveOrders = [];

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    usersID = appServices.sharedPreferences.getString("users_id")!;
    lang = appServices.sharedPreferences.getString("lang")!;
    getOrders();
    super.onInit();
  }

  @override
  getOrders() async {
    statusRequest = StatusRequest.loading;
    var response = await checkoutData.getOrders(usersID);
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List dataPending = response["pending"];
        List dataArchive = response["archive"];
        pendingOrders.addAll(dataPending.map((e) => OrdersModel.fromJson(e)));
        archiveOrders.addAll(dataArchive.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshPage() async {
    pendingOrders.clear();
    archiveOrders.clear();
    getOrders();
  }

  @override
  goToOrdersDetails(ordersModel) {
    Get.toNamed(AppRoutes.viewOrdersDetails, arguments: {
      "ordersModel": ordersModel,
    });
  }

  @override
  deleteOrders(ordersID) async {
    statusRequest = StatusRequest.loading;
    var response = await checkoutData.deleteOrders(ordersID);
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        pendingOrders
            .removeWhere((element) => element.ordersId.toString() == ordersID);
      } else {
        return Get.rawSnackbar(message: "tryAgain".tr);
      }
    }
    update();
  }
}
