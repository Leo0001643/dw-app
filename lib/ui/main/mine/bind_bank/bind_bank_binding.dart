import 'package:get/get.dart';

import 'bind_bank_logic.dart';

class BindBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BindBankLogic());
  }
}
