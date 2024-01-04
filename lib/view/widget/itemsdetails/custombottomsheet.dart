import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/itemsdetails_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/functions/translatedatabase.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';
import 'package:rimzone_shop/view/widget/itemsdetails/userevaluation.dart';

class CustomBottomSheetItemsDetails
    extends GetView<ItemsDetailsControllerImplement> {
  final ScrollController scrollController;
  const CustomBottomSheetItemsDetails(
      {super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        decelerationRate: ScrollDecelerationRate.fast,
      ),
      controller: scrollController,
      child: Container(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, bottom: Get.width / 2),
        decoration: const BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Container(
                      alignment: controller.lang == "ar"
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: CustomTitleText(
                        title:
                            "${translateDatabase(controller.model.itemsNameAr, controller.model.itemsNameEn, controller.model.itemsNameFr)}",
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: AppColor.redColor,
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                  child: Text(
                    "-${controller.model.itemsDiscount}% ${"onSale".tr}",
                    style: const TextStyle(
                        color: AppColor.secondColor, fontSize: 16.0),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 120.0,
              child: DropdownButtonFormField(
                isDense: true,
                value: controller.selectedQuantity,
                onChanged: (value) {
                  controller.onChangeItemsQuantity(value!);
                },
                items: List.generate(
                    controller.model.itemsCount != 0
                        ? controller.model.itemsCount
                        : 1,
                    (index) => index + 1).map<DropdownMenuItem>((int value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text('$value'),
                  );
                }).toList(),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                  prefix: Text("${'Quantity'.tr}  : "),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Row(
              children: [
                CustomUserEvaluationItemsDetails(
                  iconData: Icons.star,
                  value: "4.8",
                  iconColor: AppColor.yellowAccentShade700,
                ),
                SizedBox(width: 10.0),
                CustomUserEvaluationItemsDetails(
                  iconData: Icons.thumb_up,
                  value: "94%",
                  iconColor: AppColor.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              "${translateDatabase(controller.model.itemsDescAr, controller.model.itemsDescEn, controller.model.itemsDescFr)}",
            ),
          ],
        ),
      ),
    );
  }
}
