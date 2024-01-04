import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/testview_controller.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
      ),
      body: GetBuilder<TestViewController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(
              child: Text("Loading..."),
            );
          } else if (controller.statusRequest == StatusRequest.offlineFailure) {
            return const Center(
              child: Text("Offline Failure"),
            );
          } else if (controller.statusRequest == StatusRequest.serverFailure) {
            return const Center(
              child: Text("Server Failure"),
            );
          } else if (controller.statusRequest ==
              StatusRequest.serverException) {
            return const Center(
              child: Text("Server Exception"),
            );
          } else if (controller.statusRequest == StatusRequest.failure) {
            return const Center(
              child: Text("No data"),
            );
          } else {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data[index]}");
              },
            );
          }
        },
      ),
    );
  }
}
