import 'package:get/get.dart';
import 'package:rimzone_shop/data/model/orders_details_model.dart';

abstract class ProductOrderDetailsController extends GetxController {
  //
}

class ProductOrderDetailsControllerImplement
    extends ProductOrderDetailsController {
  late OrdersDetailsModel ordersDetailsModelReceive;
  @override
  void onInit() {
    ordersDetailsModelReceive = Get.arguments["ordersDetailsModel"];
    super.onInit();
  }
}
