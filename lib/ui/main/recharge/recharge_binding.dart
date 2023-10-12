import 'package:get/get.dart';

import 'recharge_logic.dart';

class RechargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeLogic());
  }
}
