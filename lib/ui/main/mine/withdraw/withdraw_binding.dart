import 'package:get/get.dart';

import 'withdraw_logic.dart';

class WithdrawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawLogic());
  }
}
