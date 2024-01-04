import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/checkoutcontroller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomCheckOutSteps extends StatelessWidget {
  final String imageName;
  final String title;
  final int index;
  const CustomCheckOutSteps({
    super.key,
    required this.imageName,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutControllerImplement>(
      builder: (controller) => Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imageName,
              height: 40.0,
              width: 40.0,
              color: controller.initialPage >= index
                  ? AppColor.primaryColor
                  : Colors.grey,
            ),
            Text(
              title,
              style: TextStyle(
                  color: controller.initialPage >= index
                      ? AppColor.primaryColor
                      : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
