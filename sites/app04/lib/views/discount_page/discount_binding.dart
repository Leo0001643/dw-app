import 'package:get/get.dart';

import 'discount_controller.dart';

class DiscountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscountController());
  }
}
