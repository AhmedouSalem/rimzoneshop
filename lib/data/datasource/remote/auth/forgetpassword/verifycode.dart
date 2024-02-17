import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class VerifyCodeResetData {
  Crud crud;
  VerifyCodeResetData(this.crud);

  postVerifyCodeResetData(String email, String verifyCode) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.verifyCodeReset, {
      "email": email,
      "verifyCode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendEmail(String username, String email) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.resendEmail, {
      "username": username,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
