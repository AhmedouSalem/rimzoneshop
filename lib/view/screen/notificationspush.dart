import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rimzone_shop/controller/notifications_controller.dart';
import 'package:rimzone_shop/core/class/handlingdataview.dart';

class NotificationsDefaultHomePage extends StatelessWidget {
  const NotificationsDefaultHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsControllerImplement());
    return SafeArea(
      minimum: const EdgeInsets.only(top: 35.0),
      child: GetBuilder<NotificationsControllerImplement>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.notificationDataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    "${controller.notificationDataList[index].notificationTitle}"),
                subtitle: Text(
                    "${controller.notificationDataList[index].notificationBody}"),
                trailing: Text(
                  Jiffy.parse(
                    controller
                        .notificationDataList[index].notificationDateTime!,
                  ).fromNow(),
                ),
                leading: const Icon(Icons.mark_email_read),
              );
            },
          ),
        ),
      ),
    );
  }
}
