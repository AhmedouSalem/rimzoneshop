import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/notification_data.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/data/model/notifications_model.dart';

abstract class NotificationsController extends GetxController {
  getData();
}

class NotificationsControllerImplement extends NotificationsController {
  NotificationsData notificationsData = NotificationsData(Get.find<Crud>());
  List<NotificationsModel> notificationDataList = [];
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  late String usersID;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationsData.getData(usersID);
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List data = response["data"];
        notificationDataList
            .addAll(data.map((e) => NotificationsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    usersID = appServices.sharedPreferences.getString("users_id")!;
    getData();
    super.onInit();
  }
}
