import 'package:get/get.dart';
import 'package:rimzone_shop/core/services/services.dart';

String? translateDatabase(
    String? columnAr, String? columnEn, String? columnFr) {
  AppServices appServices = Get.find();
  if (appServices.sharedPreferences.getString("lang") == "ar") {
    return columnAr;
  } else if (appServices.sharedPreferences.getString("lang") == "en") {
    return columnEn;
  } else {
    return columnFr;
  }
}
