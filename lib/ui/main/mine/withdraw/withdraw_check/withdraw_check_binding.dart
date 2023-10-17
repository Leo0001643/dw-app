import 'package:get/get.dart';

import 'withdraw_check_logic.dart';

class WithdrawCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawCheckLogic());
  }
}
