import 'package:rimzone_shop/core/class/crud.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
