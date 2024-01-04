import 'package:flutter/src/widgets/navigator.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:get/get.dart';

class AppMiddleWare extends GetMiddleware {
  AppServices appServices = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (appServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.homeScreen);
    }
    if (appServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.signIn);
    }
    return super.redirect(route);
  }
}
