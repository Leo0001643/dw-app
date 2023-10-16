import 'package:get/get.dart';

import 'recharge_result_logic.dart';

class RechargeResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeResultLogic());
  }
}
