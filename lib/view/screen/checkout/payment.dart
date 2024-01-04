import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/checkoutcontroller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/data/datasource/static/static.dart';
import 'package:rimzone_shop/view/widget/checkout/cardpaymentmethod.dart';
import 'package:rimzone_shop/view/widget/checkout/sectiontitle.dart';
import 'package:rimzone_shop/view/widget/checkout/textformpayment.dart';

class CustomPayment extends StatelessWidget {
  const CustomPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GetBuilder<CheckOutControllerImplement>(
        builder: (controller) => ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            CustomSectionTitleCheckout(title: "paymentMethod".tr),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  cardPaymentMethod.length + 1,
                  (index) {
                    int i = index >= 2 ? index - 1 : index;
                    return index == 1
                        ? const SizedBox(width: 10.0)
                        : Expanded(
                            child: InkWell(
                              onTap: () {
                                controller.choosePaymentMethod(
                                    i, cardPaymentMethod[i].imageName!);
                              },
                              child: CustomCardPaymentMethod(
                                imageName: cardPaymentMethod[i].imageName!,
                                title: cardPaymentMethod[i].subtitle!,
                                isActive: controller.paymentMethodId == i,
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
            if (controller.paymentMethodId == 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15.0),
                  CustomSectionTitleCheckout(
                    title: "cardNumber".tr,
                    size: 0.0,
                  ),
                  const CustomTextFormPayment(),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomSectionTitleCheckout(
                              title: "expiration".tr,
                              size: 0.0,
                            ),
                            const CustomTextFormPayment(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomSectionTitleCheckout(
                              title: "securityCode".tr,
                              size: 0.0,
                            ),
                            const CustomTextFormPayment(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  CustomSectionTitleCheckout(
                    title: "voucherCode".tr,
                    size: 0.0,
                  ),
                  const CustomTextFormPayment(),
                  const SizedBox(height: 15.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: true,
                        onChanged: (value) {},
                        checkColor: AppColor.secondColor,
                        activeColor: AppColor.primaryColor,
                      ),
                      Expanded(
                        child: Text(
                          "sentence".tr,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
