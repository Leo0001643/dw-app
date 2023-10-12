import 'package:get/get.dart';

import 'service_details_logic.dart';

class ServiceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceDetailsLogic());
  }
}
