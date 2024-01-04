import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColor.colorGrey,
      ),
      backgroundColor: AppColor.secondColor,
      elevation: 0.0,
      title: CustomTitleText(title: title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
