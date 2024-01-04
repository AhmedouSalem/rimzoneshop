import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomUserEvaluationItemsDetails extends StatelessWidget {
  final IconData iconData;
  final dynamic value;
  final Color? iconColor;
  const CustomUserEvaluationItemsDetails({
    super.key,
    required this.iconData,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: AppColor.bluGrey50),
      ),
      minWidth: Get.width / 12,
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: iconColor,
          ),
          const SizedBox(
            width: 2.0,
          ),
          Text(
            "$value",
            style: const TextStyle(fontFamily: "Cairo"),
          ),
        ],
      ),
    );
  }
}
