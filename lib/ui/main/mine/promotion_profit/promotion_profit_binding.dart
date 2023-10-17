import 'package:get/get.dart';

import 'promotion_profit_logic.dart';

class PromotionProfitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PromotionProfitLogic());
  }
}
