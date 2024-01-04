import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

warning(String title, String message) {
  return Get.defaultDialog(
      contentPadding: EdgeInsets.zero,
      title: title,
      content: Text(
        message,
        style: Theme.of(Get.context!).textTheme.bodyMedium,
      ),
      actions: [
        InkWell(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(19.5),
            bottomRight: Radius.circular(19.5),
          ),
          radius: 19.5,
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(19.5),
                bottomRight: Radius.circular(19.5),
              ),
            ),
            child: Text(
              textAlign: TextAlign.center,
              "Close".tr,
              style: const TextStyle(color: AppColor.secondColor),
            ),
          ),
        ),
      ]);
}
