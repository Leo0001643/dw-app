import 'package:get/get.dart';

import 'recharge_offline_logic.dart';

class RechargeOfflineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeOfflineLogic());
  }
}
