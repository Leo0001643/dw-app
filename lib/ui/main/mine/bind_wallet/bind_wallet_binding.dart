import 'package:get/get.dart';

import 'bind_wallet_logic.dart';

class BindWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BindWalletLogic());
  }
}
