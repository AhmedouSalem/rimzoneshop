import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class ItemsData {
  Crud crud;
  ItemsData(
    this.crud,
  );

  getDataItems(String? categoriesID, String? usersID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.items, {
      "categories_id": categoriesID,
      "users_id": usersID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
