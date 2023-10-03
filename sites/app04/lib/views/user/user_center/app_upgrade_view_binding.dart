import 'package:app04/views/user/user_center/controller/user_controller.dart';
import 'package:get/get.dart';

class AppUpgradeViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}
