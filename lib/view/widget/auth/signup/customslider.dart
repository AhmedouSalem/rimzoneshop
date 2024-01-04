import 'package:flutter/material.dart';
import 'package:rimzone_shop/controller/auth/signup_controller/createaccount_controller.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/data/datasource/static/static.dart';
import 'package:rimzone_shop/view/widget/auth/Customformfield.dart';
import 'package:rimzone_shop/view/widget/auth/custombodytext.dart';
import 'package:rimzone_shop/view/widget/shared/customtitletext.dart';
import 'package:rimzone_shop/view/widget/shared/customprimarybutton.dart';
import 'package:get/get.dart';

class CustomSliderSignUp extends StatelessWidget {
  const CustomSliderSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountControllerImplement>(
      builder: (controller) {
        return Form(
          key: controller.globalKey,
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            itemCount: signUpPageViewList.length - 1,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    index > 0
                        ? Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                splashColor: AppColor.secondColor,
                                highlightColor: AppColor.secondColor,
                                onTap: () {
                                  controller.arrowBackToPage(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.zero,
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                    right: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 28,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(height: 40.0),
                    controller.isOpenKeyboard
                        ? const SizedBox.shrink()
                        : CustomTitleText(
                            title: signUpPageViewList[index].title,
                          ),
                    CustomBodyTextAuth(
                      bodyText: signUpPageViewList[index].body,
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextFormFieldAuth(
                      fontSize: controller.lang == "ar" ? 10.0 : 14.7,
                      keyboardType: index == 2
                          ? TextInputType.phone
                          : TextInputType.emailAddress,
                      validator: (val) {
                        controller.validatorInput(
                            val,
                            signUpPageViewList[index].minLength,
                            signUpPageViewList[index].maxLength,
                            signUpPageViewList[index].type);
                        return null;
                      },
                      focusNode: controller.listFocusNode[index],
                      onTapField: () {
                        controller.onTapField(
                            controller.isFieldAutoFocus[index], index);
                      },
                      labelColor: controller.isFieldAutoFocus[index] == true
                          ? controller.borderColor
                          : controller.color,
                      isAutoFocus: controller.isFieldAutoFocus[index],
                      borderColor: controller.isFieldAutoFocus[index] == true
                          ? controller.borderColor
                          : controller.color,
                      textEditingController:
                          controller.listTextEditingController[index],
                      boolObscureText:
                          controller.listTextEditingController[index] ==
                                      controller.listTextEditingController[3] ||
                                  controller.listTextEditingController[index] ==
                                      controller.listTextEditingController[4]
                              ? controller.isShowPassword
                              : false,
                      labelText: signUpPageViewList[index].labelText,
                      suffixIcon: index < signUpPageViewList.length - 2
                          ? signUpPageViewList[index].suffixIcon
                          : controller.iconData,
                      iconColor: controller.isFieldAutoFocus[index] == true
                          ? controller.borderColor
                          : controller.color,
                      onTapIcon: index < signUpPageViewList.length - 2
                          ? null
                          : () {
                              controller.showPassword();
                            },
                    ),
                    index >= signUpPageViewList.length - 2
                        ? Column(
                            children: [
                              CustomTextFormFieldAuth(
                                fontSize: controller.lang == "ar" ? 10.0 : 14.7,
                                textEditingController:
                                    controller.listTextEditingController[
                                        signUpPageViewList.length - 1],
                                boolObscureText: controller.isShowPassword,
                                labelText: signUpPageViewList[
                                        signUpPageViewList.length - 1]
                                    .labelText,
                                borderColor: controller.isFieldAutoFocus[
                                            signUpPageViewList.length - 1] ==
                                        true
                                    ? controller.forgetPasswordSecondColor
                                    : controller.forgetPasswordPrimaryColor,
                                isAutoFocus: controller.isFieldAutoFocus[
                                    signUpPageViewList.length - 1],
                                focusNode: controller.listFocusNode[
                                    signUpPageViewList.length - 1],
                                labelColor: controller.isFieldAutoFocus[
                                            signUpPageViewList.length - 1] ==
                                        true
                                    ? controller.forgetPasswordSecondColor
                                    : controller.forgetPasswordPrimaryColor,
                                onTapField: () {
                                  controller.onTapField(
                                      controller.isFieldAutoFocus[
                                          signUpPageViewList.length - 1],
                                      signUpPageViewList.length - 1);
                                },
                              ),
                              Text(
                                controller.matchingPassword,
                                style:
                                    const TextStyle(color: AppColor.redColor),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                    Text(
                      controller.msgError,
                      style: const TextStyle(color: AppColor.redColor),
                    ),
                    index == 1 || index == 2
                        ? CustomButtonPrimary(
                            margin: const EdgeInsets.only(bottom: 20.0),
                            buttonColor: AppColor.secondColor,
                            textButton: controller.textButton,
                            textColor: AppColor.primaryColor,
                            onPressed: () {
                              controller.changAuthenticateProvider(index);
                            },
                            isLoading: false,
                          )
                        : const SizedBox(height: 0.0),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
