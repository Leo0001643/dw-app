import 'package:app04/views/user/user_center/controller/user_controller.dart';
import 'package:get/get.dart';

import '../controller/upgrade_controller.dart';

class UpgradeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpgradeController());
  }
}
