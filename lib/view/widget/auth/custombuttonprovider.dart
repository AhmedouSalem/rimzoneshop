import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CustomButtonProviderAuth extends StatelessWidget {
  const CustomButtonProviderAuth({
    super.key,
    required this.assetName,
    this.margin,
    this.onPressed,
  });
  final String assetName;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(color: AppColor.colorGrey),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: MaterialButton(
          highlightColor: AppColor.secondColor,
          splashColor: AppColor.secondColor,
          onPressed: onPressed,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Image.asset(
              width: double.infinity,
              assetName,
            ),
          ),
        ),
      ),
    );
  }
}
