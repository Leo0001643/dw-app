import 'package:get/get.dart';

import 'recharge_wallet_logic.dart';

class RechargeWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeWalletLogic());
  }
}
