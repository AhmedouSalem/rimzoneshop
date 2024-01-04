import 'package:dartz/dartz.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';

class TestData {
  Crud crud;
  TestData(
    this.crud,
  );

  getDataTest() async {
    Either<StatusRequest, Map<String, dynamic>> response =
        await crud.postData(AppApiLinks.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
