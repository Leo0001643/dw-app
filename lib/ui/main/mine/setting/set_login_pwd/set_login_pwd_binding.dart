import 'package:get/get.dart';

import 'set_login_pwd_logic.dart';

class SetLoginPwdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetLoginPwdLogic());
  }
}
