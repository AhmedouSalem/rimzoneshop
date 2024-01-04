import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/home_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/shared/searchitems.dart';

class CustomTextFormSearchHome extends GetView<HomeControllerImplement> {
  final void Function()? onPressedSearch;
  final String title;
  const CustomTextFormSearchHome(
      {super.key, this.onPressedSearch, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: InkWell(
        onTap: () {
          showSearch(
            context: Get.context!,
            delegate: SearchItems(),
            useRootNavigator: true,
          );
        },
        child: TextFormField(
          enabled: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 0.0,
              bottom: 0.0,
              left: 10.0,
              right: 10.0,
            ),
            hintText: title,
            hintStyle: const TextStyle(color: AppColor.colorGrey),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: AppColor.bluGrey50,
            suffixIcon: IconButton(
              onPressed: onPressedSearch,
              icon: const Icon(
                Icons.search,
                color: AppColor.blackColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
