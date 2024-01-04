import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class ViewFavoriteData {
  Crud crud;
  ViewFavoriteData(
    this.crud,
  );

  getDataViewFavorite(String? usersID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.viewFavorite, {
      "users_id": usersID,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromFavorite(String? usersID, String itemsID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.favoriteRemove, {
      "users_id": usersID,
      "items_id": itemsID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
