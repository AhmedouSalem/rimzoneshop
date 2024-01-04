import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/controller/checkoutcontroller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/view/widget/auth/Customformfield.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';

class CustomAddAddressForm extends StatelessWidget {
  const CustomAddAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutControllerImplement>(
      builder: (controller) => Form(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.addressFormField.length,
              itemBuilder: (context, index) {
                return CustomTextFormFieldAuth(
                  onTapField: () {
                    controller.onTapField(index);
                  },
                  textEditingController: controller.addressFormField[index],
                  boolObscureText: false,
                  borderColor: controller.isAutoFocus[index]
                      ? AppColor.primaryColor
                      : null,
                  isAutoFocus: controller.isAutoFocus[index],
                  labelText: controller.labelTextAddress[index],
                );
              },
            ),
            CustomButtonPrimary(
              buttonColor: AppColor.primaryColor,
              textButton: "Add".tr,
              textColor: AppColor.secondColor,
              margin: EdgeInsets.zero,
              isLoading: controller.isLoading,
              onPressed: controller.isLoading
                  ? null
                  : () {
                      controller.addAddress();
                    },
            ),
          ],
        ),
      ),
    );
  }
}
