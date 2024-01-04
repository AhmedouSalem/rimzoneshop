import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class SignInData {
  Crud crud;
  SignInData(this.crud);

  postSignInData(String email, String password) async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.signIn, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
