import 'package:app04/views/user/records/controllers/recharge_record_controller.dart';
import 'package:get/get.dart';

class RechargeRecordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeRecordController());
  }
}
