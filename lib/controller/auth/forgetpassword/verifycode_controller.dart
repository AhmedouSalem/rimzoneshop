import 'package:get/get.dart';
import 'package:rimzone_shop/core/class/crud.dart';
import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/functions/handlingdata.dart';
import 'package:rimzone_shop/core/functions/warning.dart';
import 'package:rimzone_shop/data/datasource/remote/auth/forgetpassword/verifycode.dart';

import '../../../core/constant/approutes.dart';

abstract class VerifyCodeController extends GetxController {
  goToResetPassword(String verificationCode);
}

class VerifyCodeControllerImplement extends VerifyCodeController {
  VerifyCodeResetData verifyCodeResetData =
      VerifyCodeResetData(Get.find<Crud>());
  StatusRequest? statusRequest;
  late String username;
  late String email;

  @override
  goToResetPassword(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeResetData.postVerifyCodeResetData(
      email.trim(),
      verificationCode.trim(),
    );
    statusRequest = await handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(
          AppRoutes.resetPassword,
          arguments: {
            "email": email.trim(),
          },
        );
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
    await verifyCodeResetData.resendEmail(username, email);
  }

  @override
  void onInit() {
    username = Get.arguments["username"];
    email = Get.arguments["email"];
    super.onInit();
  }
}
