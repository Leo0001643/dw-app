import 'package:get/get.dart';

import 'select_language_logic.dart';

class SelectLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectLanguageLogic());
  }
}
