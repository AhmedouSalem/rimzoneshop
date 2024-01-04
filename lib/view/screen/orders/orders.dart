import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/orders/orders_controller.dart';
import 'package:rimzone_shop/core/class/handlingdataview.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/orderspendingarchive/customcardorders.dart';

class ViewOrders extends StatelessWidget {
  const ViewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersControllerImplement());
    return GetBuilder<OrdersControllerImplement>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text("orders".tr),
          bottom: TabBar(
            controller: controller.tabController,
            indicator: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.primaryColor,
                  AppColor.secondColor,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            labelPadding: const EdgeInsets.all(15.0),
            tabs: [
              Text(
                "Pending".tr,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Archive".tr,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.tabController,
          children: [
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.pendingOrders.isEmpty
                  ? Center(
                      child: Text("pageEmpty".tr),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.pendingOrders.length,
                      itemBuilder: (context, index) {
                        return CustomCardOrders(
                          ordersModel: controller.pendingOrders[index],
                          onDetails: () {
                            controller.goToOrdersDetails(
                              controller.pendingOrders[index],
                            );
                          },
                        );
                      },
                    ),
            ),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.archiveOrders.isEmpty
                  ? Center(
                      child: Text("pageEmpty".tr),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.archiveOrders.length,
                      itemBuilder: (context, index) {
                        return CustomCardOrders(
                          ordersModel: controller.archiveOrders[index],
                          onDetails: () {
                            controller.goToOrdersDetails(
                                controller.archiveOrders[index]);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
