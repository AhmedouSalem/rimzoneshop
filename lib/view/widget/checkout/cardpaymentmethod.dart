import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomCardPaymentMethod extends StatelessWidget {
  final String imageName;
  final String title;
  final bool isActive;
  const CustomCardPaymentMethod({
    super.key,
    required this.imageName,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: isActive ? AppColor.primaryColor : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Image.asset(
          alignment: Alignment.topLeft,
          imageName,
          height: 30.0,
          width: 30.0,
          color: isActive ? AppColor.primaryColor : Colors.grey,
        ),
        subtitle: Text(title),
      ),
    );
  }
}
