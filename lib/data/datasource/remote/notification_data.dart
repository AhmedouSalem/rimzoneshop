import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class NotificationsData {
  Crud crud;
  NotificationsData(
    this.crud,
  );

  getData(String usersID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.notificationsData, {
      "users_id": usersID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
