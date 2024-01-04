import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomSectionTitleHome extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomSectionTitleHome({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              "SeeAll".tr,
              style: const TextStyle(color: AppColor.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
