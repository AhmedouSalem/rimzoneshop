import 'package:flutter/material.dart';
import 'package:rimzone_shop/bindigns/initialbindings.dart';
import 'package:rimzone_shop/core/localization/applocale_controller.dart';
import 'package:rimzone_shop/core/localization/translation.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:get/get.dart';
// import 'package:rimzone_shop/test.dart';

import 'rootes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppLocaleControllerImplement());
    return GetBuilder<AppLocaleControllerImplement>(
      builder: (controller) => GetMaterialApp(
        initialBinding: InitialBindings(),
        translations: AppTranslation(),
        locale: controller.localeLanguage,
        theme: controller.appTheme,
        initialRoute: "/",
        getPages: AppGetPageRoutes.routes,
        debugShowCheckedModeBanner: false,
        transitionDuration: const Duration(milliseconds: 500),
        defaultTransition: controller.localeLanguage.languageCode == "ar"
            ? Transition.leftToRight
            : Transition.rightToLeft,
      ),
    );
  }
}

/**
 * ***********************************
 * ***********************************
 * ***********************************
 * * Copyright : Ahmedou SALEM 2023 **
 * ***********************************
 * ***********************************
 * ***********************************/ 