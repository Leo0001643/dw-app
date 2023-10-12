import 'package:get/get.dart';

import 'html_logic.dart';

class HtmlBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HtmlLogic());
  }
}
