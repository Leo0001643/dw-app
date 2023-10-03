import 'package:app04/views/activities/controllers/signin_everyday_controller.dart';
import 'package:get/instance_manager.dart';

class SigninEverydayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninEverydayController());
  }
}
