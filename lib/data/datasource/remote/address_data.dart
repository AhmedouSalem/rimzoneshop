import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class AddressData {
  Crud crud;
  AddressData(
    this.crud,
  );

  addAddress(String usersID, String addressName, String addressCity,
      String addressStreet, String addressLat, String addressLong) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.addAddress, {
      "users_id": usersID,
      "address_name": addressName,
      "address_city": addressCity,
      "address_street": addressStreet,
      "address_lat": addressLat,
      "address_long": addressLong,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewAddress(String usersID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.viewAddress, {
      "users_id": usersID,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String addressID) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.deleteAddress, {
      "address_id": addressID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
