import 'package:get/get.dart';

import 'select_animation_logic.dart';

class SelectAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectAnimationLogic());
  }
}
