import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomButtonAddAndRemove extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;
  const CustomButtonAddAndRemove(
      {super.key, required this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: AppColor.grey300,
        ),
      ),
      onPressed: onPressed,
      child: Icon(
        iconData,
        color: AppColor.blackColor,
      ),
    );
  }
}
