import 'package:get/get.dart';

import 'add_wallet_logic.dart';

class AddWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddWalletLogic());
  }
}
