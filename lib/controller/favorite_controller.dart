import 'package:get/get.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/favorite/favorite.dart';

class FavoriteController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  FavoriteData favoriteData = FavoriteData(Get.find<Crud>());
  List data = [];
  AppServices appServices = Get.find();

  Map isFavorite = {};
  setFavorite(String id, int value) {
    isFavorite[id] = value;
    update();
  }

  addFavorite(String? itemsID) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
      appServices.sharedPreferences.getString("users_id"),
      itemsID,
    );
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
          message: "addToFavorite".tr,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // update();
  }

  removeFavorite(String? itemsID) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
      appServices.sharedPreferences.getString("users_id"),
      itemsID,
    );
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
            message: "removedFromFavorite".tr,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
