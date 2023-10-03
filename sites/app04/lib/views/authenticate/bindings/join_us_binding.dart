import 'package:aone_common/common.dart';
import 'package:app04/views/authenticate/controller/join_us_controller.dart';
import 'package:get/get.dart';

class JoinUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JoinUsController(registerType: RegisterType.agent));
  }
}
