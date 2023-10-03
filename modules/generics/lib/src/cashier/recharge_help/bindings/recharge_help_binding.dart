import 'package:generics/src/cashier/recharge_help/controllers/recharge_help_controller.dart';
import 'package:get/get.dart';

class RechargeHelpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeHelpController());
  }
}
