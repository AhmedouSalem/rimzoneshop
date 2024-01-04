import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/localization/applocale_controller.dart';
import 'package:rimzone_shop/view/widget/language/customlanguagetile.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';
import 'package:get/get.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    // AppLocaleControllerImplement appLocaleControllerImplement = Get.find();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          CustomTitleText(title: "${"Choose".tr}" "${"Language".tr}"),
          const SizedBox(height: 15.0),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                CustomLanguageTile(
                  languageCode: "ar",
                  language: "Arabic".tr,
                ),
                const Divider(
                  thickness: 1,
                  height: 0.0,
                ),
                CustomLanguageTile(
                  languageCode: "fr",
                  language: "French".tr,
                ),
                const Divider(
                  thickness: 1,
                  height: 0.0,
                ),
                CustomLanguageTile(
                  languageCode: "en",
                  language: "English".tr,
                ),
              ],
            ),
          ),
          const Spacer(),
          GetBuilder<AppLocaleControllerImplement>(
            builder: (controller) => CustomButtonPrimary(
              buttonColor: AppColor.primaryColor,
              textButton: "Continue".tr,
              textColor: AppColor.secondColor,
              margin: const EdgeInsets.only(
                bottom: 30.0,
                left: 40.0,
                right: 40.0,
              ),
              onPressed: controller.isLoading
                  ? null
                  : () async {
                      controller.changeLangue(controller.language);
                      await Future.delayed(const Duration(milliseconds: 1000));
                      controller.goToOnboarding();
                    },
              isLoading: controller.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
