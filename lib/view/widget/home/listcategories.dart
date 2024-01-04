import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/home_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/functions/translatedatabase.dart';
import 'package:rimzone_shop/data/model/categories_model.dart';

class ListCategoriesHome extends GetView<HomeControllerImplement> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding:
          controller.appServices.sharedPreferences.getString("lang") == "ar"
              ? const EdgeInsets.only(right: 15.0)
              : const EdgeInsets.only(left: 15.0),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoriesHome(
          categoriesModel:
              CategoriesModel.fromJson(controller.categories[index]),
          index: index,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 10.0),
      itemCount: controller.categories.length,
    );
  }
}

class CategoriesHome extends GetView<HomeControllerImplement> {
  final int index;
  final CategoriesModel categoriesModel;
  const CategoriesHome({
    super.key,
    required this.index,
    required this.categoriesModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(categoriesModel.categoriesId.toString(), index);
      },
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.blackColor, width: 1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          textAlign: TextAlign.center,
          "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesNameEn, categoriesModel.categoriesNameFr)}",
          style:
              controller.appServices.sharedPreferences.getString("lang") == "ar"
                  ? const TextStyle(fontSize: 12)
                  : Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
