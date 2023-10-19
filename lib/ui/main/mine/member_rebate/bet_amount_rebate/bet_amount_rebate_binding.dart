import 'package:get/get.dart';

import 'bet_amount_rebate_logic.dart';

class BetAmountRebateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BetAmountRebateLogic());
  }
}
