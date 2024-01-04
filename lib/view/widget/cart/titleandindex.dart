import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomTitleAndIndex extends StatelessWidget {
  const CustomTitleAndIndex(
      {super.key, required this.title, required this.index});
  final String title;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          index,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.blackColor,
          ),
        ),
      ],
    );
  }
}
