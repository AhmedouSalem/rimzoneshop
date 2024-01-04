import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class HomeData {
  Crud crud;
  HomeData(
    this.crud,
  );

  getDataHome(String? usersID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.home, {
      "users_id": usersID,
    });
    return response.fold((l) => l, (r) => r);
  }

  searchItems(String? usersID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.searchItems, {
      "users_id": usersID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
