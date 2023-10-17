import 'package:get/get.dart';

import 'withdraw_result_logic.dart';

class WithdrawResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawResultLogic());
  }
}
