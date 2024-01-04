import 'package:get/get.dart';
import 'package:rimzone_shop/core/constant/approutes.dart';

class SuccessResetPasswordController extends GetxController {
  goToLogin() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Get.offAllNamed(AppRoutes.signIn);
  }

  @override
  void onInit() {
    goToLogin();
    super.onInit();
  }
}
