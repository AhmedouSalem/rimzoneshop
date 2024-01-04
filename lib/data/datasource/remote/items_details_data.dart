import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class ItemDetailsData {
  Crud crud;
  ItemDetailsData(
    this.crud,
  );

  addItemToCart(
    String usersID,
    String itemsID,
    String quantity,
  ) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.addItemToCart, {
      "users_id": usersID,
      "items_id": itemsID,
      "quantity": quantity,
    });
    return response.fold((l) => l, (r) => r);
  }
}
