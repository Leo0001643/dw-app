import 'package:app04/views/recharge/controller/recharge_record_controller.dart';
import 'package:get/get.dart';

import '../controller/recharge_controller.dart';

class RechargeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeController());
  }
}
