import 'package:get/instance_manager.dart';

import '../controllers/promotion_rebate_controller.dart';

class PromotionRebateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PromotionRebateController());
  }
}
