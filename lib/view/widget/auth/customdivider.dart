import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolor.dart';
import 'custombodytext.dart';

class CustomDividerAuth extends StatelessWidget {
  const CustomDividerAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            endIndent: 8.0,
            color: AppColor.colorGrey,
          ),
        ),
        CustomBodyTextAuth(
          bodyText: "OrLoginWith".tr,
        ),
        const Expanded(
          child: Divider(
            indent: 8.0,
            color: AppColor.colorGrey,
          ),
        ),
      ],
    );
  }
}
