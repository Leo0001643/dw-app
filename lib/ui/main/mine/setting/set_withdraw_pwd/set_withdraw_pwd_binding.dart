import 'package:get/get.dart';

import 'set_withdraw_pwd_logic.dart';

class SetWithdrawPwdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetWithdrawPwdLogic());
  }
}
