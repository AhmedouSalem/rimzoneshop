import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/functions/validinput.dart';
import 'package:rimzone_shop/core/functions/warning.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/auth/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  showPassword();
  goToLogin();
  validatorInput(String val, int min, int max, String type);
}

class ResetPasswordControllerImplement extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool isShowPassword = true;
  IconData iconData = Icons.visibility_off_outlined;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isLoading = false;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find<Crud>());
  StatusRequest? statusRequest;
  String msgError = "";
  bool isPasswordFocus = false;
  bool isConfirmPassFocus = false;
  Color primaryColor = AppColor.blackColor;
  Color secondColor = AppColor.colorGrey;
  Color pConfirmColor = AppColor.blackColor;
  Color secondConfirmColor = AppColor.colorGrey;
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeConfirmPass = FocusNode();
  late String email;
  String textIsMatch = "";
  // services
  AppServices appServices = Get.find();
  String? lang;

  onTapFieldPassword() {
    isPasswordFocus = true;
    isConfirmPassFocus = false;
    update();
  }

  onTapFieldConfirmPassword() {
    isConfirmPassFocus = true;
    isPasswordFocus = false;
    update();
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    if (iconData == Icons.visibility_off_outlined) {
      iconData = Icons.visibility_outlined;
    } else {
      iconData = Icons.visibility_off_outlined;
    }
    update();
  }

  @override
  goToLogin() async {
    FormState? formData = formState.currentState;
    if (formData!.validate()) {
      if (msgError.isEmpty) {
        isLoading = true;
        FocusScope.of(Get.context!).unfocus();
        if (password.text == confirmPassword.text) {
          checkMatchPassword(true);
          update();
          statusRequest = StatusRequest.loading;
          var response = await resetPasswordData.postResetPasswordData(
            email.trim(),
            password.text,
          );
          statusRequest = await handlingData(response);
          print(statusRequest);
          if (StatusRequest.success == statusRequest) {
            if (response["status"] == "success") {
              await Future.delayed(const Duration(milliseconds: 900));
              await Get.offAllNamed(AppRoutes.successResetPassword);
            } else if (response["status"] == "failure") {
              isLoading = false;
              warning("Warning".tr,
                  "${"Failed".tr}${" ! "}${"Reset".tr.toLowerCase()} ${"Le".tr.toLowerCase()} ${"Password".tr}");
            }
          }
          if (statusRequest == StatusRequest.offlineFailure) {
            isLoading = false;
            warning("Warning".tr, "${"Check".tr} ${"ip".tr}");
          }
          if (statusRequest == StatusRequest.serverFailure) {
            isLoading = false;
            warning("Warning".tr, "${"Error".tr}  ${"serverError".tr}");
          }
          if (statusRequest == StatusRequest.serverException) {
            isLoading = false;
            warning("Error".tr, "serverException".tr);
          }
          update();
        } else {
          isLoading = false;
          checkMatchPassword(false);
          update();
        }
      }
      checkMsgError(msgError);
      update();
    }
  }

  @override
  void onInit() {
    lang = appServices.sharedPreferences.getString("lang");
    email = Get.arguments["email"];
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    focusNodePassword.dispose();
    focusNodeConfirmPass.dispose();
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

  checkMatchPassword(bool isMatchText) {
    if (isMatchText) {
      textIsMatch = "";
      secondConfirmColor = AppColor.colorGrey;
      pConfirmColor = AppColor.blackColor;
      isConfirmPassFocus = false;
    } else {
      textIsMatch = "${"Le".tr} ${"Password".tr} ${"passNotMatch".tr}";
      pConfirmColor = AppColor.redColor;
      secondConfirmColor = AppColor.redColor;
      isConfirmPassFocus = true;
    }
  }

  @override
  validatorInput(String val, int min, int max, String type) {
    msgError = validInput(val, min, max, type);
    update();
  }
}
