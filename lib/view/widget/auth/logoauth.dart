import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 170.0,
      child: Image.asset(
        AppImageAsset.logoApp,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
