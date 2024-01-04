import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/home_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/functions/translatedatabase.dart';
import 'package:rimzone_shop/view/widget/search/listitemsearch.dart';

class SearchItems extends SearchDelegate {
  HomeControllerImplement homeControllerImplement = Get.find();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            backgroundColor: AppColor.secondColor,
            iconTheme: IconThemeData(color: AppColor.blackColor),
          ),
        );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List itemsResult = homeControllerImplement.getItemsName
        .where((element) => translateDatabase(
              element['items_name_ar'],
              element['items_name_en'],
              element['items_name_fr'],
            )!
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();
    return query != ""
        ? CustomListItemsSearch(items: itemsResult)
        : const SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List itemsSuggestion = homeControllerImplement.getItemsName
        .where((element) => translateDatabase(
              element['items_name_ar'],
              element['items_name_en'],
              element['items_name_fr'],
            )!
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: itemsSuggestion.length,
      itemBuilder: (context, index) {
        return query != ""
            ? Card(
                child: ListTile(
                  onTap: () {
                    query = translateDatabase(
                      itemsSuggestion[index]['items_name_ar'],
                      itemsSuggestion[index]['items_name_en'],
                      itemsSuggestion[index]['items_name_fr'],
                    )!;
                  },
                  title: Text(
                    "${translateDatabase(
                      itemsSuggestion[index]['items_name_ar'],
                      itemsSuggestion[index]['items_name_en'],
                      itemsSuggestion[index]['items_name_fr'],
                    )}",
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
