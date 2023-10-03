import 'package:app04/views/recharge/controller/recharge_record_controller.dart';
import 'package:get/get.dart';

class RechargeRecordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeRecordController());
  }
}
