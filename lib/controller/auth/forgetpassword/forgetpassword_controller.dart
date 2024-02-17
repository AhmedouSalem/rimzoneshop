import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/functions/validinput.dart';
import 'package:rimzone_shop/core/functions/warning.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/auth/forgetpassword/checkemail.dart';

import '../../../core/constant/approutes.dart';

abstract class ForgetPasswordController extends GetxController {
  validatorInput(String val, int min, int max, String type);
  goToVerifyCode();
}

class ForgetPasswordControllerImplement extends ForgetPasswordController {
  // services
  AppServices appServices = Get.find();
  String? lang;
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isLoading = false;
  CheckEmailData checkEmailData = CheckEmailData(Get.find<Crud>());
  StatusRequest? statusRequest;
  String msgError = "";
  bool isEmailFocus = false;
  Color primaryColor = AppColor.blackColor;
  Color secondColor = AppColor.colorGrey;
  FocusNode focusNode = FocusNode();

  onTapField() {
    isEmailFocus = true;
    update();
  }

  @override
  validatorInput(String val, int min, int max, String type) {
    msgError = validInput(val, min, max, type);
    update();
  }

  @override
  goToVerifyCode() async {
    FormState? formData = formState.currentState;
    if (formData!.validate()) {
      if (msgError.isEmpty) {
        isLoading = true;
        statusRequest = StatusRequest.loading;
        FocusScope.of(Get.context!).unfocus();
        isEmailFocus = false;
        update();
        var response = await checkEmailData.postCheckEmailData(
          email.text.trim(),
        );
        statusRequest = await handlingData(response);
        print(statusRequest);
        if (StatusRequest.success == statusRequest) {
          if (response["status"] == "success") {
            Get.offAllNamed(
              AppRoutes.verifyCode,
              arguments: {
                "username": response["message"],
                "email": email.text.trim(),
              },
            );
          } else if (response["status"] == "failure") {
            isLoading = false;
            warning("Warning".tr, "emailNotFound".tr);
          }
        }
        if (statusRequest == StatusRequest.offlineFailure) {
          isLoading = false;
          warning("Warning".tr, "${"Check".tr} ${"ip".tr}");
        }
        if (statusRequest == StatusRequest.serverFailure) {
          isLoading = false;
          warning("Warning".tr, "${"Error".tr} ${"serverError".tr}");
        }
        if (statusRequest == StatusRequest.serverException) {
          isLoading = false;
          warning("Error".tr, "serverException".tr);
        }
      }
      checkMsgError(msgError);
      update();
    }
  }

  @override
  void onInit() {
    lang = appServices.sharedPreferences.getString("lang");
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    focusNode.dispose();
    super.dispose();
  }

  checkMsgError(String messageError) {
    if (messageError.isEmpty) {
      primaryColor = AppColor.blackColor;
      secondColor = AppColor.colorGrey;
    } else {
      primaryColor = AppColor.redColor;
      secondColor = AppColor.redColor;
    }
  }
}
