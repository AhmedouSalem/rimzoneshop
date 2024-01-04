import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(
    this.crud,
  );

  addFavorite(String? usersID, String? itemsID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.favoriteAdd, {
      "users_id": usersID,
      "items_id": itemsID,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String? usersID, String? itemsID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.favoriteRemove, {
      "users_id": usersID,
      "items_id": itemsID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
