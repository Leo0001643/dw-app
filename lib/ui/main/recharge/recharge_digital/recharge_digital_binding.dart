import 'package:get/get.dart';

import 'recharge_digital_logic.dart';

class RechargeDigitalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeDigitalLogic());
  }
}
