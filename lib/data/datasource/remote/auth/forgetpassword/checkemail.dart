import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postCheckEmailData(String email) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.forgetPassword, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
