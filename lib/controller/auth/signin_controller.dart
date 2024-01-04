import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/functions/warning.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/auth/signin.dart';

abstract class SignInController extends GetxController {
  showPassword();
  signIn();
  goToSignUp();
  goToForgetPassword();
}

class SignInControllerImplement extends SignInController {
  late TextEditingController email;
  late TextEditingController password;
  late KeyboardVisibilityController keyboardVisibilityController;
  bool isShowPassword = true;
  IconData iconData = Icons.visibility_off_outlined;
  bool isEmailAutoFocus = false;
  bool isPasswordAutoFocus = false;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool isOpenKeyboard = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Color color = AppColor.colorGrey;
  Color borderColor = AppColor.blackColor;
  bool isLoadingGoToSignUp = false;
  bool isLoadingSignIn = false;
  // signIn data
  SignInData signInData = SignInData(Get.find<Crud>());
  StatusRequest? statusRequest;
  // services
  AppServices appServices = Get.find();
  String? lang;

  @override
  void onInit() {
    lang = appServices.sharedPreferences.getString("lang");
    email = TextEditingController();
    password = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((bool visible) {
      isOpenKeyboard = visible;
      update();
    });
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  signIn() async {
    // Activer le focus sur le premier champ vide
    if (GetUtils.removeAllWhitespace(email.text).isEmpty ||
        !GetUtils.isEmail(email.text.trim()) &&
            !GetUtils.isUsername(email.text.trim())) {
      isEmailAutoFocus = true;
      isPasswordAutoFocus = false;
      FocusScope.of(Get.context!).requestFocus(emailFocusNode);
    } else if (GetUtils.removeAllWhitespace(password.text).isEmpty) {
      isPasswordAutoFocus = true;
      isEmailAutoFocus = false;
      FocusScope.of(Get.context!).requestFocus(passwordFocusNode);
    } else {
      isEmailAutoFocus = false;
      isPasswordAutoFocus = false;
      isLoadingSignIn = true;
      statusRequest = StatusRequest.loading;
      FocusScope.of(Get.context!).unfocus();
      update();
      var response = await signInData.postSignInData(
        email.text.trim(),
        password.text,
      );
      statusRequest = await handlingData(response);
      print(statusRequest);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          if (response["data"]["users_approve"] == 1) {
            appServices.sharedPreferences
                .setString("users_id", response["data"]["users_id"].toString());
            appServices.sharedPreferences
                .setString("users_email", response["data"]["users_email"]);
            appServices.sharedPreferences
                .setString("users_name", response["data"]["users_name"]);
            appServices.sharedPreferences.setString(
                "users_password", response["data"]["users_password"]);
            appServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic(
                "users${appServices.sharedPreferences.getString("users_id")}");
            Get.offAllNamed(AppRoutes.homeScreen);
          } else {
            Get.offAllNamed(AppRoutes.verifyCodeSignUp, arguments: {
              "email": response["data"]["users_email"],
            });
          }
        } else if (response["status"] == "failure") {
          isLoadingSignIn = false;
          warning("Warning".tr,
              "${"Email".tr} ${"Or".tr} ${"Password".tr.toLowerCase()} ${"incorrect".tr}");
        }
      }
      if (statusRequest == StatusRequest.offlineFailure) {
        isLoadingSignIn = false;
        warning("Warning".tr, "${"Check".tr} ${"ip".tr}");
      }
      if (statusRequest == StatusRequest.serverFailure) {
        isLoadingSignIn = false;
        warning("Warning".tr, "${"Error".tr} ${"serverError".tr}");
      }
      if (statusRequest == StatusRequest.serverException) {
        isLoadingSignIn = false;
        warning("Error".tr, "serverException".tr);
      }
      update();
    }
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

  onTapFieldEmail() {
    isEmailAutoFocus = true;
    isPasswordAutoFocus = false;
    update();
  }

  onTapFieldPassword() {
    isPasswordAutoFocus = true;
    isEmailAutoFocus = false;
    update();
  }

  @override
  goToForgetPassword() async {
    await Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  goToSignUp() async {
    isLoadingGoToSignUp = true;
    update();
    await Future.delayed(const Duration(milliseconds: 900));
    await Get.offAllNamed(AppRoutes.JoinApp);
  }
}
