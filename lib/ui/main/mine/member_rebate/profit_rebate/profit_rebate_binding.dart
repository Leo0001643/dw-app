import 'package:get/get.dart';

import 'profit_rebate_logic.dart';

class ProfitRebateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfitRebateLogic());
  }
}
