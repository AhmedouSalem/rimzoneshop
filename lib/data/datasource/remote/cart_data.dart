import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class CartData {
  Crud crud;
  CartData(
    this.crud,
  );

  getDataCart(String usersID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.viewCart, {
      "users_id": usersID,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeItemFromCart(String usersID, String itemsID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.removeItemsFromCart, {
      "users_id": usersID,
      "items_id": itemsID,
    });
    return response.fold((l) => l, (r) => r);
  }

  incrementItemQuantity(String usersID, String itemsID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.incrementQuantity, {
      "users_id": usersID,
      "items_id": itemsID,
    });
    return response.fold((l) => l, (r) => r);
  }

  decrementItemQuantity(String usersID, String itemsID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.decrementQuantity, {
      "users_id": usersID,
      "items_id": itemsID,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.checkCoupon, {
      "couponName": couponName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
