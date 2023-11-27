import 'package:get/get.dart';

import 'add_bank_logic.dart';

class AddBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBankLogic());
  }
}
