import 'package:get/get.dart';

import 'preferential_logic.dart';

class PreferentialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreferentialLogic());
  }
}
