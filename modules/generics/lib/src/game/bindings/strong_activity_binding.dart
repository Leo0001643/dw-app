import 'package:get/get.dart';

import '../controllers/strong_activity_controller.dart';

class StrongActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StrongActivityController());
  }
}
