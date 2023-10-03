import 'package:aone_common/common.dart';
import 'package:get/get.dart';

import '../controllers/join_us_controller.dart';

class JoinUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JoinUsController(registerType: RegisterType.agent));
  }
}
