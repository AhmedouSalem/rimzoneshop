import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postSignUpData(String username, String email, String phoneNumber,
      String password) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.signUp, {
      "username": username,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password
    });
    return response.fold((l) => l, (r) => r);
  }

  checkIsEmailExits(String email) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.checkEmailSignUp, {"email": email});
    return response.fold((l) => l, (r) => r);
  }

  checkPhoneNumber(String phoneNumber) async {
    Either<StatusRequest, Map<String, dynamic>> response = await crud
        .postData(AppApiLinks.phoneNumber, {"phoneNumber": phoneNumber});
    return response.fold((l) => l, (r) => r);
  }
}
