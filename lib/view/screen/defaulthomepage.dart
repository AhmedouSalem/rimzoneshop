import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/defaulthomepage_conroller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/defaulthomepage/custombuttonappbar.dart';

class DefaultHomePage extends StatelessWidget {
  const DefaultHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DefaultHomePageControllerImplement defaultHomePageControllerImplement =
        Get.put(DefaultHomePageControllerImplement());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(
              child: GetBuilder<DefaultHomePageControllerImplement>(
                builder: (controller) =>
                    controller.pageList.elementAt(controller.currentPage),
              ),
            ),
            Positioned(
              left: 30.0,
              right: 30.0,
              bottom: 30.0, //30.0,-90.0
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColor.primaryColor.withOpacity(0.9),
                ),
                alignment: Alignment.center,
                height: 55.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                      defaultHomePageControllerImplement.iconDataList.length,
                      (index) => CustomButtonAppBarDefaultHomePage(
                        index: index,
                        iconData: defaultHomePageControllerImplement
                            .iconDataList[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
