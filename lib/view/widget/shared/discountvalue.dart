import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomDiscountItems extends StatelessWidget {
  final int? itemsDiscount;
  final FontWeight? fontWeight;
  final String? lang;
  const CustomDiscountItems(
      {super.key,
      required this.itemsDiscount,
      this.fontWeight,
      required this.lang});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: AppColor.redColor,
        borderRadius: BorderRadius.only(
          topLeft: lang == "ar"
              ? const Radius.circular(0.0)
              : const Radius.circular(20.0),
          bottomRight: lang == "ar"
              ? const Radius.circular(0.0)
              : const Radius.circular(20.0),
          bottomLeft: lang == "ar"
              ? const Radius.circular(20.0)
              : const Radius.circular(0.0),
          topRight: lang == "ar"
              ? const Radius.circular(20.0)
              : const Radius.circular(0.0),
        ),
      ),
      child: Text(
        textDirection: TextDirection.ltr,
        "-$itemsDiscount%",
        style: TextStyle(
          color: AppColor.secondColor,
          fontSize: fontWeight == null ? 10.0 : 13.5,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
