import 'package:get/get.dart';

import 'simple_login_var_logic.dart';

class SimpleLoginVarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SimpleLoginVarLogic());
  }
}
