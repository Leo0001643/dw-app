import 'package:get/get.dart';

import 'rebate_detail_logic.dart';

class RebateDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RebateDetailLogic());
  }
}
