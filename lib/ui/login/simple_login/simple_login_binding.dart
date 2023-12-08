import 'package:get/get.dart';

import 'simple_login_logic.dart';

class SimpleLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SimpleLoginLogic());
  }
}
