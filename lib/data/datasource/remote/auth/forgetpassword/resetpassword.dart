import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postResetPasswordData(String email, String password) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
