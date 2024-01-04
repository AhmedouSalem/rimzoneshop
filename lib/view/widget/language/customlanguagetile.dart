import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/localization/applocale_controller.dart';

class CustomLanguageTile extends StatelessWidget {
  final String languageCode;
  final String language;
  const CustomLanguageTile(
      {super.key, required this.languageCode, required this.language});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLocaleControllerImplement>(
      builder: (controller) => RadioListTile(
        selected: controller.language == languageCode
            ? controller.isSelected
            : controller.notSelected,
        activeColor: AppColor.primaryColor,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(
          language,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        value: languageCode,
        onChanged: (val) {
          controller.chooseLanguage(val);
        },
        groupValue: controller.language,
      ),
    );
  }
}
