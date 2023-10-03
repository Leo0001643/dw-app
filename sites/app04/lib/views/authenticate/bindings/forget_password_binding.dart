
import 'package:app04/views/authenticate/controller/forget_password_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:get/instance_manager.dart';

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}
