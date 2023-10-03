import 'package:get/instance_manager.dart';

import '../controllers/signin_everyday_controller.dart';

class SigninEverydayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninEverydayController());
  }
}
