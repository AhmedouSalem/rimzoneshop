import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/view/widget/shared/shared.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppResponsive.fullWidth * 0.3,
      height: AppResponsive.fullWidth * 0.3,
      child: Image.asset(
        AppImageAsset.logoApp,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
