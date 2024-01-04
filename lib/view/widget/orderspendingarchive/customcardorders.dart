import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rimzone_shop/controller/orders/orders_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/data/model/orders_model.dart';

class CustomCardOrders extends GetView<OrdersControllerImplement> {
  final OrdersModel ordersModel;
  final Function()? onDetails;
  const CustomCardOrders(
      {super.key, required this.ordersModel, required this.onDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15.0),
      shadowColor: AppColor.primaryColor,
      color: AppColor.bluGrey50,
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${"ordersN".tr}° : #${ordersModel.ordersId}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(Jiffy.parse(ordersModel.ordersDateTime!).fromNow()),
                    ],
                  ),
                ),
                Table(
                  children: [
                    TableRow(
                      children: [
                        Text("subTotal".tr),
                        Text("${ordersModel.ordersSubtotal}€"),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("deliveryFee".tr),
                        Text("${ordersModel.ordersPriceDelivery}€"),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("discount".tr),
                        Text("${ordersModel.ordersDiscount}%")
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("paymentMethod".tr),
                        Text(
                          ordersModel.ordersPaymentMethod == 1
                              ? 'cash'.tr
                              : 'creditCard'.tr,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("ordersStatus".tr),
                        GetBuilder<OrdersControllerImplement>(
                          builder: (controller) => AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              ordersModel.ordersStatus == 2
                                  ? WavyAnimatedText(
                                      'Preparing'.tr,
                                      textStyle: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 14.0,
                                      ),
                                    )
                                  : ordersModel.ordersStatus == 0
                                      ? ScaleAnimatedText(
                                          duration:
                                              const Duration(milliseconds: 600),
                                          'Pending'.tr,
                                          textStyle: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: 14.0,
                                          ),
                                        )
                                      : ordersModel.ordersStatus == 3
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
                                          : ordersModel.ordersStatus == -1
                                              ? ColorizeAnimatedText(
                                                  "Rejected".tr,
                                                  textStyle: const TextStyle(
                                                    color: AppColor.redColor,
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
                                              : TypewriterAnimatedText(
                                                  speed: const Duration(
                                                    milliseconds: 200,
                                                  ),
                                                  "Delivered".tr,
                                                  textStyle: const TextStyle(
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("${"total".tr} : "),
                        Text(
                          "${ordersModel.ordersPriceTotal}€",
                        ),
                      ],
                    ),
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
                      child: MaterialButton(
                        textColor: AppColor.blackColor,
                        onPressed: onDetails,
                        child: Text("Details".tr),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          if (ordersModel.ordersStatus == 0 || ordersModel.ordersStatus == -1)
            Positioned(
              top: -15,
              right: controller.lang == "ar" ? null : -15,
              left: controller.lang == "ar" ? -15 : null,
              child: IconButton(
                onPressed: () {
                  controller.deleteOrders(ordersModel.ordersId.toString());
                },
                icon: const Icon(Icons.close_outlined),
              ),
            ),
        ],
      ),
    );
  }
}
