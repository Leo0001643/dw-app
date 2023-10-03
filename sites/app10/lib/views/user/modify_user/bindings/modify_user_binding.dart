import 'package:get/instance_manager.dart';

import '../controllers/modify_user_controller.dart';

class ModifyUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModifyUserController());
  }
}
