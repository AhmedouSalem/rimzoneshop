import 'package:get/get.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/functions/warning.dart';
import 'package:rimzone_shop/data/datasource/remote/auth/verifycode.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  verifyCode();
  goToLogin(String verificationCode);
}

class VerifyCodeSignUpControllerImplement extends VerifyCodeSignUpController {
  late String username;
  late String email;
  VerifyCodeSignUpData verifyCodeSignUpData =
      VerifyCodeSignUpData(Get.find<Crud>());
  StatusRequest? statusRequest;

  @override
  verifyCode() {}

  @override
  goToLogin(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postVerifyCodeSignUpData(
      email.trim(),
      verificationCode.trim(),
    );
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoutes.successSignUp);
      } else if (response["status"] == "failure") {
        warning("Warning".tr, "${"CodeVerification".tr} ${"incorrect".tr}");
        statusRequest = StatusRequest.failure;
      }
    }
    if (statusRequest == StatusRequest.offlineFailure) {
      warning("Warning".tr, "${"Check".tr} ${"ip".tr}");
    }
    if (statusRequest == StatusRequest.serverFailure) {
      warning("Warning".tr, "${"Error".tr} ${"serverError".tr}");
    }
    if (statusRequest == StatusRequest.serverException) {
      warning("Error".tr, "serverException".tr);
    }
    update();
  }

  resendEmail() async {
    await verifyCodeSignUpData.resendEmail(username, email);
  }

  @override
  void onInit() {
    username = Get.arguments["username"];
    email = Get.arguments["email"];
    super.onInit();
  }
}
