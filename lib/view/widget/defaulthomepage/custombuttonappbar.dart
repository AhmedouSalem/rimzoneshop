import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/defaulthomepage_conroller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';

class CustomButtonAppBarDefaultHomePage extends StatelessWidget {
  final int index;
  final IconData iconData;
  const CustomButtonAppBarDefaultHomePage({
    super.key,
    required this.index,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DefaultHomePageControllerImplement>(
      builder: (controller) => Expanded(
        child: MaterialButton(
          elevation: 0.0,
          highlightElevation: 0.0,
          color: controller.currentPage == index ? AppColor.secondColor : null,
          shape: const CircleBorder(),
          height: 60.0,
          onPressed: () {
            controller.onPageChanged(index);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
              Icon(
                iconData,
                color: controller.currentPage == index
                    ? AppColor.primaryColor
                    : AppColor.secondColor,
                size: 30.0,
              ),
              Positioned(
                bottom: 2.5,
                child: CircleAvatar(
                  radius: 2,
                  backgroundColor: controller.currentPage == index
                      ? AppColor.redColor
                      : AppColor.primaryColor.withOpacity(0.1),
                ),
              ),
              index == 1
                  ? Positioned(
                      right: 15.0,
                      top: 9.0,
                      child: Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                          color: AppColor.redColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            "33",
                            style: TextStyle(
                              fontSize: 7.0,
                              color: AppColor.secondColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cairo",
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
