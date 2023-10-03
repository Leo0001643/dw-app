import 'package:get/get.dart';

import '../../withdraw_new/controller/withdraw_money_controller.dart';

class WithdrawMoneyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawMoneyController());
  }
}
