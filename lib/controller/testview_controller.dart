import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestViewController extends GetxController {
  TestData testData = TestData(Get.find<Crud>());
  List data = [];
  StatusRequest? statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getDataTest();
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
