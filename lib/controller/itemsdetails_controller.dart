import 'package:get/get.dart';
import 'package:rimzone_shop/controller/favorite_controller.dart';
import 'package:rimzone_shop/controller/home_controller.dart';
import 'package:rimzone_shop/controller/viewfavorite_controller.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/items_details_data.dart';
import 'package:rimzone_shop/data/model/favorite_model.dart';
import 'package:rimzone_shop/data/model/items_model.dart';

abstract class ItemsDetailsController extends GetxController {
  setFavorite(String itemsID);
}

class ItemsDetailsControllerImplement extends ItemsDetailsController {
  ItemDetailsData itemDetailsData = ItemDetailsData(Get.find<Crud>());
  late String hero;
  late String usersID;
  ItemsModel? itemsModel;
  FavoriteModel? favoriteModel;
  String? lang;
  FavoriteController favoriteController = Get.find();
  AppServices appServices = Get.find();
  int selectedQuantity = 1;
  bool isLoading = false;
  StatusRequest statusRequest = StatusRequest.none;
  bool disabled = false;
  dynamic model;

  @override
  void onInit() {
    lang = appServices.sharedPreferences.getString("lang");
    itemsModel = Get.arguments["itemsModel"];
    favoriteModel = Get.arguments["favoriteModel"];
    hero = Get.arguments["hero"];
    usersID = appServices.sharedPreferences.getString("users_id")!;
    model = checkModel(itemsModel, favoriteModel);
    // if (model.itemsCount == 0) {
    //   disabled = true;
    // }
    super.onInit();
  }

  @override
  void onClose() {
    if (favoriteModel != null) {
      ViewFavoriteControllerImplement viewFavController = Get.find();
      viewFavController.itemsFavorite.clear();
      viewFavController.getFavoriteItems(true);
    }
    itemsModel = null;
    favoriteModel = null;
    super.onClose();
  }

  onChangeItemsQuantity(int quantity) {
    selectedQuantity = quantity;
    update();
  }

  checkModel(ItemsModel? itemsModel, FavoriteModel? favoriteModel) {
    if (itemsModel == null) {
      return favoriteModel;
    } else {
      return itemsModel;
    }
  }

  @override
  setFavorite(itemsID) {
    if (favoriteController.isFavorite[itemsID] == 0) {
      favoriteController.setFavorite(
        itemsID,
        1,
      );
      favoriteController.addFavorite(
        itemsID,
      );
    } else {
      favoriteController.setFavorite(
        itemsID,
        0,
      );
      favoriteController.removeFavorite(
        itemsID,
      );
    }
    update();
  }

  addToCart(String itemsID) async {
    isLoading = true;
    update();
    statusRequest = StatusRequest.loading;
    var response = await itemDetailsData.addItemToCart(
        usersID, itemsID, selectedQuantity.toString());
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      isLoading = false;
      if (response["status"] == "success") {
        if (Get.isRegistered<HomeControllerImplement>()) {
          HomeControllerImplement homeControllerImplement = Get.find();
          homeControllerImplement.onChangeCountCartItems(
              homeControllerImplement.countCartItems += selectedQuantity);
        }
        Get.rawSnackbar(
          message: "addedToCart".tr,
          snackPosition: SnackPosition.TOP,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
