import 'package:get/get.dart';

import 'recharge_category_logic.dart';

class RechargeCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeCategoryLogic());
  }
}
