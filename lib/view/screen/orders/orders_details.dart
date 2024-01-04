import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rimzone_shop/controller/orders/orders_details_controller.dart';
import 'package:rimzone_shop/core/class/handlingdataview.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/orderspendingarchive/customitemslist.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsControllerImplement controllerImplement =
        Get.put(OrdersDetailsControllerImplement());
    return Scaffold(
      appBar: AppBar(
        title: Text("ordersDetails".tr),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        children: [
          Container(
            // padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColor.bluGrey50,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${"ordersN".tr}° : #${controllerImplement.ordersModel.ordersId}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Jiffy.parse(
                                controllerImplement.ordersModel.ordersDateTime!)
                            .fromNow(),
                      ),
                    ],
                  ),
                ),
                GetBuilder<OrdersDetailsControllerImplement>(
                  builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            controller.getProductDetails(
                              controller.ordersDetailsData[index].itemsId!,
                              controller.ordersDetailsData[index],
                            );
                          },
                          child: CustomItemsOrdersList(
                            ordersDetailsModel:
                                controller.ordersDetailsData[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.ordersDetailsData.length,
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          Text("subTotal".tr),
                          Text(
                            "${controllerImplement.ordersModel.ordersSubtotal}€",
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("deliveryFee".tr),
                          Text(
                            "${controllerImplement.ordersModel.ordersPriceDelivery}€",
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("discount".tr),
                          Text(
                            "${controllerImplement.ordersModel.ordersDiscount}%",
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("paymentMethod".tr),
                          Text(
                            controllerImplement
                                        .ordersModel.ordersPaymentMethod ==
                                    1
                                ? 'cash'.tr
                                : 'creditCard'.tr,
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("ordersStatus".tr),
                          GetBuilder<OrdersDetailsControllerImplement>(
                            builder: (controller) {
                              return AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  controller.ordersModel.ordersStatus == 2
                                      ? WavyAnimatedText(
                                          'Preparing'.tr,
                                          textStyle: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: 14.0,
                                          ),
                                        )
                                      : controller.ordersModel.ordersStatus == 0
                                          ? ScaleAnimatedText(
                                              duration: const Duration(
                                                  milliseconds: 600),
                                              'Pending'.tr,
                                              textStyle: const TextStyle(
                                                color: AppColor.primaryColor,
                                                fontSize: 14.0,
                                              ),
                                            )
                                          : controller.ordersModel
                                                      .ordersStatus ==
                                                  3
                                              ? ColorizeAnimatedText(
                                                  "terminate".tr,
                                                  textStyle: const TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  colors: [
                                                    Colors.purple,
                                                    Colors.blue,
                                                    Colors.yellow,
                                                    Colors.green,
                                                  ],
                                                )
                                              : controller.ordersModel
                                                          .ordersStatus ==
                                                      -1
                                                  ? ColorizeAnimatedText(
                                                      "Rejected".tr,
                                                      textStyle:
                                                          const TextStyle(
                                                        color:
                                                            AppColor.redColor,
                                                        fontSize: 14.0,
                                                      ),
                                                      colors: [
                                                        Colors.purple,
                                                        const Color.fromARGB(
                                                            255, 243, 33, 180),
                                                        const Color.fromARGB(
                                                            255, 255, 72, 59),
                                                        Colors.red,
                                                      ],
                                                    )
                                                  : FlickerAnimatedText(
                                                      "Delivered".tr,
                                                      textStyle:
                                                          const TextStyle(
                                                        color: AppColor
                                                            .primaryColor,
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${"total".tr} "),
                      Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: const LinearGradient(
                            colors: [
                              AppColor.primaryColor,
                              AppColor.secondColor,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                      Text(
                        "${controllerImplement.ordersModel.ordersPriceTotal}€",
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
