import 'package:flutter/material.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/appcolor.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/functions/validinput.dart';
import 'package:rimzone_shop/core/functions/warning.dart';
import 'package:rimzone_shop/core/services/services.dart';
import 'package:rimzone_shop/data/datasource/remote/auth/signup.dart';
import 'package:rimzone_shop/data/datasource/static/static.dart';
import 'package:rimzone_shop/view/widget/auth/custombodytext.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

abstract class CreateAccountController extends GetxController {
  onPageChanged(int index);
  nextPage();
  goToVerifyCodeSignUp();
  showPassword();
  changAuthenticateProvider(int index);
  arrowBackToPage(int index);
  goToSign();
}

class CreateAccountControllerImplement extends CreateAccountController {
  // services
  AppServices appServices = Get.find();
  String? lang;
  //Start  focus Node
  late List<FocusNode> listFocusNode;
  // End Focus Node
  late List<TextEditingController> listTextEditingController;
  late PageController pageController;
  // Start
  late List<bool> isFieldAutoFocus;
  Color color = AppColor.colorGrey;
  Color borderColor = AppColor.blackColor;
  Color forgetPasswordPrimaryColor = AppColor.colorGrey;
  Color forgetPasswordSecondColor = AppColor.blackColor;
  // End
  String msgError = "";
  String matchingPassword = "";
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  int currentPage = 0;
  IconData iconData = Icons.visibility_off_outlined;
  bool isShowPassword = true;
  late KeyboardVisibilityController keyboardVisibilityController;
  bool isOpenKeyboard = false;
  bool isLoading = false;
  // email or phone
  String textButton = "${"AuthenticateWith".tr}"
      "${"Le".tr.toLowerCase()}"
      "${" "}"
      "${"Phone".tr.toLowerCase()}";
  // SignUp Data
  SignUpData signUpData = SignUpData(Get.find<Crud>());
  StatusRequest? statusRequest;
  String dataWarningOrError = "";

  @override
  arrowBackToPage(int index) {
    if (index == 1 || index == 2) {
      currentPage = 0;
    }
    if (currentPage == 3) {
      if (listTextEditingController[1].text.isEmpty) {
        currentPage--;
      } else {
        currentPage = 1;
      }
      listTextEditingController[4].text = "";
    }
    listTextEditingController[index].text = "";
    FocusScope.of(Get.context!).unfocus();
    msgError = "";
    dataWarningOrError = "";
    matchingPassword = "";
    checkMatchingPassword(true);
    checkMsgError(msgError);
    pageController.jumpToPage(
      currentPage,
    );
    update();
  }

  @override
  changAuthenticateProvider(int index) {
    if (index == 1) {
      currentPage = index + 1;
      textButton = "${"AuthenticateWith".tr}"
          "${"l'".tr.toLowerCase()}"
          "${"Email".tr.toLowerCase()}";
    } else if (index == 2) {
      currentPage = index - 1;
      textButton = "${"AuthenticateWith".tr}"
          "${"Le".tr.toLowerCase()}"
          "${" "}"
          "${"Phone".tr.toLowerCase()}";
    }
    msgError = "";
    checkMsgError(msgError);

    FocusScope.of(Get.context!).unfocus();
    pageController.jumpToPage(
      currentPage,
    );
    listTextEditingController[index].text = "";
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

  validatorInput(val, min, max, type) {
    msgError = validInput(val, min, max, type);
    update();
  }

  onTapField(bool val, int index) {
    if (index <= signUpPageViewList.length - 2) {
      if (index == signUpPageViewList.length - 2) {
        isFieldAutoFocus[signUpPageViewList.length - 1] = false;
      }
      isFieldAutoFocus[index] = true;
      isFieldAutoFocus.forEach((element) {
        if (element != isFieldAutoFocus[index]) {
          element = false;
        }
      });
      update();
    }
    if (index == signUpPageViewList.length - 1) {
      isFieldAutoFocus[signUpPageViewList.length - 1] = true;
      isFieldAutoFocus[signUpPageViewList.length - 2] = false;
      // isFieldAutoFocus.forEach((element) {
      //   if (element != isFieldAutoFocus[signUpPageViewList.length - 1]) {
      //     element = false;
      //     print("element => $element");
      //   }
      // });
      update();
    }
  }

  @override
  nextPage() async {
    FormState? formState = globalKey.currentState;
    if (formState!.validate()) {
      dataWarningOrError = "";
      if (msgError.isEmpty && dataWarningOrError.isEmpty) {
        isLoading = true;
        if (currentPage >= signUpPageViewList.length - 2) {
          FocusScope.of(Get.context!).unfocus();
          if (listTextEditingController[signUpPageViewList.length - 2].text ==
              listTextEditingController[signUpPageViewList.length - 1].text) {
            checkMatchingPassword(true);
            update();
            statusRequest = StatusRequest.loading;
            var response = await signUpData.postSignUpData(
              listTextEditingController[0].text.trim(),
              listTextEditingController[1].text.trim(),
              listTextEditingController[2].text.trim(),
              listTextEditingController[3].text.trim(),
            );
            statusRequest = await handlingData(response);
            print(statusRequest);
            if (StatusRequest.success == statusRequest) {
              if (response["status"] == "success") {
                Get.offAllNamed(AppRoutes.verifyCodeSignUp, arguments: {
                  "username": listTextEditingController[0].text.trim(),
                  "email": listTextEditingController[1].text.trim(),
                });
              } else if (response["status"] == "failure") {
                msgError = "Failed".tr;
                statusRequest = StatusRequest.failure;
                isLoading = false;
              }
            }
            if (statusRequest == StatusRequest.offlineFailure) {
              dataWarningOrError = "${"Check".tr} ${"ip".tr}";
              isLoading = false;
              warning("Warning".tr, dataWarningOrError);
            }
            if (statusRequest == StatusRequest.serverFailure) {
              dataWarningOrError = "${"Error".tr} ${"serverError".tr}";
              isLoading = false;
              warning("Warning".tr, dataWarningOrError);
            }
            if (statusRequest == StatusRequest.serverException) {
              dataWarningOrError = "serverException".tr;
              isLoading = false;
              warning("Error".tr, dataWarningOrError);
            }
            update();
          } else {
            isLoading = false;
            checkMatchingPassword(false);
            update();
          }
        } else if (currentPage < signUpPageViewList.length - 2) {
          currentPage++;
          if (currentPage == 2) {
            // Check Email
            if (listTextEditingController[currentPage - 1].text.isNotEmpty) {
              statusRequest = StatusRequest.loading;
              var response = await signUpData
                  .checkIsEmailExits(listTextEditingController[1].text.trim());
              statusRequest = await handlingData(response);
              print(statusRequest);
              if (StatusRequest.success == statusRequest) {
                if (response["status"] == "failure") {
                  msgError = "${"This".tr} ${"Email".tr} ${"alreadyExists".tr}";
                  statusRequest = StatusRequest.failure;
                  isLoading = false;
                  currentPage = 0;
                }
              }
              if (statusRequest == StatusRequest.offlineFailure) {
                dataWarningOrError = "${"Check".tr} ${"ip".tr}";
                isLoading = false;
                warning("Warning".tr, dataWarningOrError);
                currentPage = 0;
              }
              if (statusRequest == StatusRequest.serverFailure) {
                dataWarningOrError = "${"Error".tr} ${"serverError".tr}";
                isLoading = false;
                warning("Warning".tr, dataWarningOrError);
                currentPage = 0;
              }
              if (statusRequest == StatusRequest.serverException) {
                dataWarningOrError = "serverException".tr;
                isLoading = false;
                warning("Error".tr, dataWarningOrError);
                currentPage = 0;
              }
              update();
              currentPage++;
            }
          }
          if (currentPage == 3) {
            //Check Phone Number
            // statusRequest = StatusRequest.loading;
            // var response = await signUpData
            //     .checkIsEmailExits(listTextEditingController[1].text.trim());
            // statusRequest = handlingData(response);
            // print(statusRequest);
            // if (StatusRequest.success == statusRequest) {
            //   if (response["status"] == "failure") {
            //     msgError = "Email is already exists";
            //     statusRequest = StatusRequest.failure;
            //     isLoading = false;
            //     currentPage = 0;
            //   }
            // }
            // update();
          }
          FocusScope.of(Get.context!).unfocus();
          isFieldAutoFocus[currentPage - 1] = false;
          update();
          await Future.delayed(const Duration(milliseconds: 900));
          pageController.animateToPage(
            currentPage,
            duration: const Duration(microseconds: 500),
            curve: Curves.easeInOut,
          );
          isLoading = false;
          print(currentPage);
        }
      }
      checkMsgError(msgError);
      update();
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    lang = appServices.sharedPreferences.getString("lang");
    pageController = PageController();
    // Start init FocusNode
    listFocusNode = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
    ];
    // End init FocusNode
    listTextEditingController = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    isFieldAutoFocus = [
      false,
      false,
      false,
      false,
      false,
    ];
    keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((visible) {
      if (visible == true) {
        isOpenKeyboard = true;
      } else {
        isOpenKeyboard = false;
      }
      update();
    });
    super.onInit();
  }

  @override
  void dispose() {
    listTextEditingController.forEach((element) {
      element.dispose();
    });
    pageController.dispose();
    listFocusNode.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

  @override
  goToVerifyCodeSignUp() {
    Get.toNamed(AppRoutes.verifyCodeSignUp
        // , arguments: {
        //   "username": listTextEditingController[0].text.trim(),
        //   "email": listTextEditingController[1].text.trim(),
        // }
        );
  }

  @override
  goToSign() {
    Get.defaultDialog(
      title: "stopCreate".tr,
      content: CustomBodyTextAuth(bodyText: "ifStopCreate".tr),
      textConfirm: "Confirm".tr,
      confirmTextColor: AppColor.secondColor,
      textCancel: "Cancel".tr,
      buttonColor: AppColor.primaryColor,
      cancelTextColor: AppColor.primaryColor,
      onConfirm: () {
        Get.offAllNamed(AppRoutes.signIn);
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  checkMsgError(String messageError) {
    if (messageError.isEmpty) {
      borderColor = AppColor.blackColor;
      color = AppColor.colorGrey;
    } else {
      borderColor = AppColor.redColor;
      color = AppColor.redColor;
    }
  }

  checkMatchingPassword(bool isMatch) {
    if (isMatch) {
      matchingPassword = "";
      forgetPasswordPrimaryColor = AppColor.colorGrey;
      forgetPasswordSecondColor = AppColor.blackColor;
      isFieldAutoFocus[signUpPageViewList.length - 1] = false;
    } else {
      matchingPassword =
          "${"Le".tr.capitalizeFirst} ${"Password".toLowerCase()} ${"passNotMatch".tr}";
      forgetPasswordPrimaryColor = AppColor.redColor;
      forgetPasswordSecondColor = AppColor.redColor;
      isFieldAutoFocus[signUpPageViewList.length - 1] = true;
    }
  }
}
