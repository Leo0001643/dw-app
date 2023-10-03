
import 'package:get/instance_manager.dart';

import '../controller/password_modify_controller.dart';

class PasswordModifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordModifyController());
    // TODO: implement dependencies
  }
}
