import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
// import 'package:rimzone_shop/controller/home_controller.dart';
// import 'package:rimzone_shop/controller/viewfavorite_controller.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/services/services.dart';

abstract class SettingsController extends GetxController {
  goToChangePassword();
  changeLanguage();
  goToAddress();
  goToOrders();
  exitToApp();
}

class SettingsControllerImplement extends SettingsController {
  AppServices appServices = Get.find();
  late String username;
  late String email;
  List<Map<String, dynamic>> generalInfo = [
    {
      "title": "Change Password",
      "icon": const Icon(Icons.password_outlined),
    },
    {
      "title": "Address",
      "icon": const Icon(Icons.location_on_outlined),
    },
    {
      "title": "Language",
      "icon": const Icon(Icons.language_outlined),
    },
    {
      "title": "Logout",
      "icon": const Icon(Icons.exit_to_app_outlined),
    },
  ];
  List<Map<String, dynamic>> supportList = [
    {
      "title": "About",
      "icon": const Icon(Icons.help_outline_outlined),
    },
    {
      "title": "Contact us",
      "icon": const Icon(Icons.phone_callback_outlined),
    },
  ];

  @override
  void onInit() {
    username = appServices.sharedPreferences.getString("users_name")!;
    email = appServices.sharedPreferences.getString("users_email")!;
    Jiffy.setLocale(appServices.sharedPreferences.getString("lang")!);
    super.onInit();
  }

  @override
  goToChangePassword() {}

  @override
  changeLanguage() {}

  @override
  exitToApp() {
    appServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoutes.signIn);
  }

  @override
  goToAddress() {
    Get.toNamed(AppRoutes.viewAddress);
  }

  @override
  goToOrders() {
    Get.toNamed(AppRoutes.viewOrders);
  }
}
