import 'package:get/get.dart';

import 'select_theme_logic.dart';

class SelectThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectThemeLogic());
  }
}
