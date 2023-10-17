import 'package:get/get.dart';

import 'withdraw_apply_logic.dart';

class WithdrawApplyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawApplyLogic());
  }
}
