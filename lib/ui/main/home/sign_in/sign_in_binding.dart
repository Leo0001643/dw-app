import 'package:get/get.dart';

import 'sign_in_logic.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInLogic());
  }
}
