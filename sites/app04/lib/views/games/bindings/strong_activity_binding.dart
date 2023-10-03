import 'package:get/get.dart';

import '../../games/controllers/strong_activity_controller.dart';

class StrongActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StrongActivityController());
  }
}
