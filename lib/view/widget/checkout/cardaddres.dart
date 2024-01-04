import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CardAddressCheckout extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  final Function()? onDeleteAddress;
  const CardAddressCheckout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isActive,
    this.onDeleteAddress,
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
        subtitle: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
        trailing: IconButton(
          onPressed: onDeleteAddress,
          icon: const Icon(
            Icons.delete_forever_outlined,
            color: AppColor.redColor,
          ),
        ),
      ),
    );
  }
}
