import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/core/constant/apilinks.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/shared/discountvalue.dart';
import 'package:shimmer/shimmer.dart';

class CustomItemsImage extends StatelessWidget {
  final int? itemsId;
  final String hero;
  final String? itemsImage;
  final int? itemsDiscount;
  final FontWeight? fontWeight;
  final String? lang;
  const CustomItemsImage({
    this.fontWeight,
    required this.itemsId,
    required this.hero,
    required this.itemsImage,
    required this.itemsDiscount,
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: lang == "ar" ? Alignment.topRight : Alignment.topLeft,
      children: [
        AnimatedContainer(
          alignment: Alignment.center,
          margin: fontWeight == null ? const EdgeInsets.only(right: 5.0) : null,
          padding: const EdgeInsets.all(8.0),
          width: fontWeight == null ? null : Get.width / (2),
          height: fontWeight == null ? null : Get.width / (2.5),
          decoration: BoxDecoration(
            color: AppColor.bluGrey50,
            borderRadius: BorderRadius.circular(20.0),
          ),
          duration: const Duration(microseconds: 1),
          child: Hero(
            tag: "${itemsId}_$hero",
            child: CachedNetworkImage(
              alignment: Alignment.center,
              imageUrl: "${AppApiLinks.imageItems}/$itemsImage",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
        if (itemsDiscount != 0)
          Positioned(
            right: fontWeight == null && lang == "ar" ? 5.0 : null,
            top: 0,
            child: CustomDiscountItems(
              itemsDiscount: itemsDiscount,
              fontWeight: fontWeight,
              lang: lang,
            ),
          ),
        if (itemsDiscount != 0)
          Positioned(
            right: fontWeight == null && lang == "ar" ? 5.0 : null,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!.withOpacity(0.2),
              highlightColor: Colors.grey[100]!.withOpacity(0.7),
              child: CustomDiscountItems(
                lang: lang,
                itemsDiscount: itemsDiscount,
                fontWeight: fontWeight,
              ),
            ),
          ),
      ],
    );
  }
}
