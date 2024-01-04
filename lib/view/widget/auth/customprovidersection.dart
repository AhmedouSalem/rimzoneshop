import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appimageasset.dart';
import 'package:rimzone_shop/view/widget/auth/custombuttonprovider.dart';

class CustomProviderSection extends StatelessWidget {
  const CustomProviderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtonProviderAuth(
            assetName: AppImageAsset.facebookLogo,
            onPressed: () {},
          ),
        ),
        Expanded(
          child: CustomButtonProviderAuth(
            assetName: AppImageAsset.googleLogo,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: CustomButtonProviderAuth(
            assetName: AppImageAsset.appleLogo,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
