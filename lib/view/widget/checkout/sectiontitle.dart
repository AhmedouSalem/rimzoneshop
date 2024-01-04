import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomSectionTitleCheckout extends StatelessWidget {
  final String title;
  final double? size;
  const CustomSectionTitleCheckout({super.key, required this.title, this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: size ?? 10.0),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
