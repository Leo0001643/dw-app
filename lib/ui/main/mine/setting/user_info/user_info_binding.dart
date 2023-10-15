import 'package:get/get.dart';

import 'user_info_logic.dart';

class UserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserInfoLogic());
  }
}
