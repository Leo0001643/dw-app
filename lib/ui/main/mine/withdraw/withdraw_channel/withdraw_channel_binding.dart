import 'package:get/get.dart';

import 'withdraw_channel_logic.dart';

class WithdrawChannelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawChannelLogic());
  }
}
