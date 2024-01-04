import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/items_controller.dart';
import 'package:rimzone_shop/core/functions/translatedatabase.dart';
import 'package:rimzone_shop/data/model/categories_model.dart';
import 'package:rimzone_shop/view/widget/items/categorieinkwell.dart';

class ListCategoriesItems extends GetView<ItemsControllerImplement> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoriesItems(
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

class CategoriesItems extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final int index;
  const CategoriesItems({
    super.key,
    required this.categoriesModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImplement>(
      builder: (controller) {
        return index == 0
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoriesInkwell(
                    index: "All",
                    catID: "All",
                    title: "SeeAll".tr,
                  ),
                  const SizedBox(width: 10.0),
                  CategoriesInkwell(
                    index: index,
                    catID: categoriesModel.categoriesId.toString(),
                    title:
                        "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesNameEn, categoriesModel.categoriesNameFr)}",
                  ),
                ],
              )
            : CategoriesInkwell(
                index: index,
                catID: categoriesModel.categoriesId.toString(),
                title:
                    "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesNameEn, categoriesModel.categoriesNameFr)}",
              );
      },
    );
  }
}
