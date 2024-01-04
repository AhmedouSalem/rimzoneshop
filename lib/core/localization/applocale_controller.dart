import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/constant/apptheme.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:get/get.dart';

abstract class AppLocaleController extends GetxController {
  changeLangue(languageCode);
  chooseLanguage(languageCode);
  goToOnboarding();
}

class AppLocaleControllerImplement extends AppLocaleController {
  AppServices services = Get.find();
  String? language;
  bool isSelected = true;
  bool notSelected = false;
  late Locale localeLanguage;
  ThemeData appTheme = themeEnglishAndFrench;
  Transition? transitionAnimate;
  bool isLoading = false;
  List<String> languageCodeList = [
    "ar",
    "fr",
    "en",
  ];

  @override
  changeLangue(languageCode) async {
    isLoading = true;
    update();
    Locale locale = Locale(languageCode);
    await services.sharedPreferences.setString("lang", languageCode);
    appTheme = languageCode == "ar" ? themeArabic : themeEnglishAndFrench;
    transitionAnimate =
        languageCode == "ar" ? Transition.leftToRight : Transition.rightToLeft;
    Get.updateLocale(locale);
    isLoading = false;
    Jiffy.setLocale(languageCode);
    update();
  }

  @override
  void onInit() {
    String? initialLang = services.sharedPreferences.getString("lang");
    String deviceLocaleLanguageCode = Get.deviceLocale!.languageCode;
    if (initialLang == null) {
      if (deviceLocaleLanguageCode != "ar" &&
          deviceLocaleLanguageCode != "fr" &&
          deviceLocaleLanguageCode != "en") {
        deviceLocaleLanguageCode = "en";
        localeLanguage = const Locale("en");
        appTheme = themeEnglishAndFrench;
      } else {
        localeLanguage = Locale(Get.deviceLocale!.languageCode);
        language = Get.deviceLocale!.languageCode;
        appTheme = language == "ar" ? themeArabic : themeEnglishAndFrench;
        transitionAnimate =
            language == "ar" ? Transition.leftToRight : Transition.rightToLeft;
      }
    } else {
      localeLanguage = Locale(initialLang);
      language = initialLang;
      appTheme = language == "ar" ? themeArabic : themeEnglishAndFrench;
      transitionAnimate =
          language == "ar" ? Transition.leftToRight : Transition.rightToLeft;
    }

    super.onInit();
  }

  @override
  chooseLanguage(languageCode) {
    language = languageCode;
    update();
  }

  @override
  goToOnboarding() async {
    await Get.offNamed(AppRoutes.onboarding);
  }
}
