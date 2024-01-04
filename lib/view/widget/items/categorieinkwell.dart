import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/items_controller.dart';

class CategoriesInkwell extends GetView<ItemsControllerImplement> {
  final dynamic index;
  final String catID;
  final String title;
  const CategoriesInkwell({
    super.key,
    required this.index,
    required this.catID,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.onPageChanged(index, catID);
      },
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: controller.getItemColor(
            controller.currentIndex == index,
            false,
          ),
          border: Border.all(
              color: controller.getItemColor(
                controller.currentIndex == index,
                true,
              )!,
              width: 1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: controller.lang == "ar"
              ? TextStyle(
                  color: controller.getItemTextStyle(
                    controller.currentIndex == index,
                  ),
                  fontSize: 12,
                )
              : Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: controller.getItemTextStyle(
                      controller.currentIndex == index,
                    ),
                  ),
        ),
      ),
    );
  }
}
