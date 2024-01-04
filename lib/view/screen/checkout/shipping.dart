import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/checkoutcontroller.dart';
import 'package:rimzone_shop/core/class/handlingdataview.dart';
import 'package:rimzone_shop/data/datasource/static/static.dart';
import 'package:rimzone_shop/view/widget/checkout/cardaddres.dart';
import 'package:rimzone_shop/view/widget/checkout/carddeliverytype.dart';
import 'package:rimzone_shop/view/widget/checkout/customdialog.dart';
import 'package:rimzone_shop/view/widget/checkout/sectiontitle.dart';

class Shipping extends StatelessWidget {
  const Shipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          GetBuilder<CheckOutControllerImplement>(
            builder: (controller) => controller.deliveryType == "1"
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSectionTitleCheckout(title: "Address".tr),
                          InkWell(
                            onTap: () {
                              controller.getCurrentPosition();
                              Get.dialog(
                                const Dialog(
                                  insetPadding: EdgeInsets.zero,
                                  child: CustomDialogCheckout(),
                                ),
                              );
                            },
                            child: CustomSectionTitleCheckout(
                                title: "+${"Add".tr}"),
                          ),
                        ],
                      ),
                      HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: controller.listAddress.isEmpty
                            ? Center(
                                child: Text("emptyAddress".tr),
                              )
                            : ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10.0),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.listAddress.length,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    controller.chooseAddress(controller
                                        .listAddress[index].addressId!);
                                  },
                                  child: CardAddressCheckout(
                                    title:
                                        "${controller.listAddress[index].addressName}",
                                    subtitle:
                                        "${controller.listAddress[index].addressCity}, ${controller.listAddress[index].addressStreet}",
                                    isActive: controller
                                            .listAddress[index].addressId ==
                                        controller.addressId,
                                    onDeleteAddress: () {
                                      controller.deleteAddress(controller
                                          .listAddress[index].addressId
                                          .toString());
                                    },
                                  ),
                                ),
                              ),
                      ),
                    ],
                  )
                : const Center(
                    child: SizedBox.shrink(),
                  ),
          ),
          const SizedBox(height: 15.0),
          CustomSectionTitleCheckout(title: "deliveryType".tr),
          GetBuilder<CheckOutControllerImplement>(
            builder: (checkoutController) => ListView.separated(
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 10.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cardDeliveryType.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  checkoutController.chooseDeliveryType(
                      cardDeliveryType[index].id!,
                      cardDeliveryType[index].imageName!);
                },
                child: CardDeliveryTypeCheckout(
                  title: cardDeliveryType[index].title!,
                  subtitle: cardDeliveryType[index].subtitle!,
                  imageName: cardDeliveryType[index].imageName!,
                  isActive: cardDeliveryType[index].id ==
                      checkoutController.deliveryType,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
