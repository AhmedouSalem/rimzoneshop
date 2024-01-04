import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imageName;
  final String title;
  final String subtitle;
  final bool isActive;
  const CardDeliveryTypeCheckout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageName,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        border:
            Border.all(color: isActive ? AppColor.primaryColor : Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        dense: true,
        title: Text(
          title,
          style: const TextStyle(
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
        leading: Image.asset(
          imageName,
          height: 25.0,
          width: 25.0,
          // color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
