import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CustomBottomTextAuth extends StatelessWidget {
  const CustomBottomTextAuth({
    super.key,
    required this.signInOrSignUp,
    required this.onTap,
  });
  final String signInOrSignUp;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            splashColor: AppColor.secondColor,
            highlightColor: AppColor.secondColor,
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              // width: double.infinity,
              child: Text(
                signInOrSignUp,
                style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
