import 'package:get/get.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/checkout_data.dart';
import 'package:rimzone_shop/data/model/orders_details_model.dart';
import 'package:rimzone_shop/data/model/orders_model.dart';

abstract class OrdersDetailsController extends GetxController {
  getOrdersDetails(OrdersModel x);
  getProductDetails(int itemsID, OrdersDetailsModel ordersDetailsModelSend);
}

class OrdersDetailsControllerImplement extends OrdersDetailsController {
  late OrdersModel ordersModel;
  CheckoutData checkoutData = CheckoutData(Get.find<Crud>());
  StatusRequest statusRequest = StatusRequest.none;
  late String lang;
  // late String usersID;
  List<OrdersDetailsModel> ordersDetailsData = [];
  AppServices appServices = Get.find();

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersModel"];
    lang = appServices.sharedPreferences.getString("lang")!;
    getOrdersDetails(ordersModel);
    super.onInit();
  }

  @override
  getOrdersDetails(x) async {
    statusRequest = StatusRequest.loading;
    var response = await checkoutData.getOrdersDetails(x.ordersId.toString());
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List data = response["data"];
        ordersDetailsData
            .addAll(data.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getProductDetails(itemsID, ordersDetailsModelSend) {
    Get.toNamed(AppRoutes.viewProductOrderDetails, arguments: {
      "ordersDetailsModel": ordersDetailsModelSend,
    });
  }
}
