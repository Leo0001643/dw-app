import 'package:get/get.dart';

import '../controllers/withdraw_money_controller.dart';

class WithdrawMoneyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawMoneyController());
  }
}
