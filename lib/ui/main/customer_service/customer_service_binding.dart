import 'package:get/get.dart';

import 'customer_service_logic.dart';

class CustomerServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerServiceLogic());
  }
}
