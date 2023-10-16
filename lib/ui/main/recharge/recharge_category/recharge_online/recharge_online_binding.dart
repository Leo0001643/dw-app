import 'package:get/get.dart';

import 'recharge_online_logic.dart';

class RechargeOnlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeOnlineLogic());
  }
}
