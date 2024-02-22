import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/view/widget/shared/shared.dart';

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
    return TextButton(
      onPressed: (){},
      child: Container(
        width: AppResponsive.fullWidth * 0.13,
        height: AppResponsive.fullWidth * 0.13,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(AppResponsive.fullWidth * 0.13),
          color: AppColor.secondColor,
          // image: DecorationImage(
          //   fit: BoxFit.fill,
          //   image: AssetImage(
          //     assetName,
          //   ),
          // ),
        ),
        child: Image.asset(assetName, fit: BoxFit.fill,),
      ),
    );
  }
}
