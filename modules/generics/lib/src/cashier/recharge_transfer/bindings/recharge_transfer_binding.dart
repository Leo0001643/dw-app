import 'package:generics/src/cashier/recharge_transfer/controllers/recharge_transfer_controller.dart';
import 'package:get/get.dart';

class RechargeTransferBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeTransferController());
  }
}
