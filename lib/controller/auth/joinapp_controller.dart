import 'package:rimzone_shop/core/constant/approutes.dart';
import 'package:get/get.dart';

abstract class JoinAppController extends GetxController {
  getStarted();
  goToSignIn();
}

class JoinAppControllerImplement extends JoinAppController {
  bool isLoadingGetStarted = false;
  bool isLoadingGoToSignIn = false;

  @override
  getStarted() async {
    isLoadingGetStarted = true;
    update();
    await Future.delayed(const Duration(milliseconds: 900));
    await Get.offNamed(AppRoutes.createUsername);
  }

  @override
  goToSignIn() async {
    isLoadingGoToSignIn = true;
    update();
    await Future.delayed(const Duration(milliseconds: 900));
    await Get.offAllNamed(AppRoutes.signIn);
  }
}
