import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomExpandTileReviewsCheckout extends StatelessWidget {
  final String leadingTitle;
  final String title;
  final String? body;
  final Widget? widget;
  final Widget? leadingDetails;
  const CustomExpandTileReviewsCheckout({
    super.key,
    required this.leadingTitle,
    required this.title,
    this.body,
    this.widget,
    this.leadingDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpansionTile(
          collapsedIconColor: AppColor.blackColor,
          expandedAlignment: Alignment.center,
          leading: Text(
            leadingTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          children: [
            ListTile(
              titleTextStyle: TextStyle(
                  height: 0.0,
                  color: widget != null ? AppColor.colorGrey : null),
              dense: true,
              minVerticalPadding: 0.0,
              leading: leadingDetails,
              title: widget ??
                  Text(
                    body!,
                    style: const TextStyle(color: AppColor.colorGrey),
                  ),
            ),
          ],
        ),
        const Divider(
          thickness: 0.5,
          height: 0.0,
        ),
      ],
    );
  }
}
