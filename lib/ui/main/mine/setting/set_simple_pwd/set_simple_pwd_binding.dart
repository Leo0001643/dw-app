import 'package:get/get.dart';

import 'set_simple_pwd_logic.dart';

class SetSimplePwdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetSimplePwdLogic());
  }
}
