import 'package:get/get.dart';

import 'recharge_record_logic.dart';

class RechargeRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeRecordLogic());
  }
}
