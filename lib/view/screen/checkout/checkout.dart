import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/checkoutcontroller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/data/datasource/static/static.dart';
import 'package:rimzone_shop/view/screen/checkout/reviews.dart';
import 'package:rimzone_shop/view/widget/checkout/checkoutstep.dart';
import 'package:rimzone_shop/view/screen/checkout/payment.dart';
import 'package:rimzone_shop/view/screen/checkout/shipping.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutControllerImplement checkOutControllerImplement =
        Get.put(CheckOutControllerImplement());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColor.colorGrey,
        ),
        backgroundColor: AppColor.secondColor,
        elevation: 0.0,
        title: CustomTitleText(title: "checkout".tr),
        centerTitle: true,
        leading: GetBuilder<CheckOutControllerImplement>(
          builder: (controller) => controller.initialPage != 2
              ? IconButton(
                  onPressed: () {
                    controller.animateToPageIndexDecrement();
                  },
                  icon: const Icon(Icons.arrow_back_outlined),
                )
              : const SizedBox.shrink(),
        ),
      ),
      bottomNavigationBar: GetBuilder<CheckOutControllerImplement>(
        builder: (controller) => CustomButtonPrimary(
          buttonColor: AppColor.primaryColor,
          textButton: controller.buttonText(),
          textColor: AppColor.secondColor,
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          isLoading: controller.isConfirmed,
          onPressed: controller.isConfirmed
              ? null
              : () {
                  controller.animateToPageIndexIncrement();
                },
        ),
      ),
      body: WillPopScope(
        onWillPop: checkOutControllerImplement.willBack,
        child: Column(
          children: [
            Container(
              height: 90.0,
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: const BoxDecoration(
                color: AppColor.bluGrey50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  checkoutStep.length + 2,
                  (index) {
                    int i = index;
                    if (index == 2) {
                      i = index - 1;
                    }
                    if (index == 4) {
                      i = index - 2;
                    }
                    return index == 1 || index == 3
                        ? const Expanded(child: Divider(thickness: 1.5))
                        : CustomCheckOutSteps(
                            imageName: checkoutStep[i].imageName!,
                            title: checkoutStep[i].title!,
                            index: i,
                          );
                  },
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: checkOutControllerImplement.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  Shipping(),
                  CustomPayment(),
                  CheckoutReviews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
