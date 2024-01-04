import 'package:get/get.dart';
import 'package:rimzone_shop/controller/favorite_controller.dart';
// import 'package:rimzone_shop/controller/home_controller.dart';
// import 'package:rimzone_shop/controller/settings_controller.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/favorite/view_favorite.dart';
import 'package:rimzone_shop/data/model/favorite_model.dart';

abstract class ViewFavoriteController extends GetxController {
  getFavoriteItems(bool isInRoot);
  goToItemsDetails(FavoriteModel favoriteModel);
}

class ViewFavoriteControllerImplement extends ViewFavoriteController {
  late String hero;
  List itemsFavorite = [];
  StatusRequest statusRequest = StatusRequest.none;
  ViewFavoriteData viewFavoriteData = ViewFavoriteData(Get.find<Crud>());
  AppServices appServices = Get.find();
  FavoriteController favoriteController = Get.find();

  @override
  void onInit() {
    getFavoriteItems(true);
    // if (!HomeControllerImplement().isClosed &&
    //     !SettingsControllerImplement().isClosed) {
    //   Get.delete<HomeControllerImplement>();
    //   Get.delete<SettingsControllerImplement>();
    // }
    hero = "viewFavorite";
    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   Get.delete<ViewFavoriteControllerImplement>();
  // }

  @override
  getFavoriteItems(isInRoot) async {
    if (isInRoot) {
      statusRequest = StatusRequest.loading;
      update();
    }
    var response = await viewFavoriteData.getDataViewFavorite(
      appServices.sharedPreferences.getString("users_id"),
    );
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List data = response["data"];
        if (isInRoot) {
          itemsFavorite.addAll(data);
        } else {
          for (var element in data) {
            if (!itemsFavorite
                .map((e) => e.toString())
                .contains(element.toString())) {
              itemsFavorite.add(element);
            }
          }
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItemsDetails(favoriteModel) {
    Get.toNamed(
      AppRoutes.itemsDetails,
      arguments: {
        "favoriteModel": favoriteModel,
        "hero": hero,
      },
    );
  }

  removeFavorite(String itemsID) {
    viewFavoriteData.removeFromFavorite(
      appServices.sharedPreferences.getString("users_id"),
      itemsID,
    );
    favoriteController.setFavorite(itemsID, 0);
    itemsFavorite
        .removeWhere((element) => element['items_id'].toString() == itemsID);
    update();
  }
}
