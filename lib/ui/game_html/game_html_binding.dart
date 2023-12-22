import 'package:get/get.dart';

import 'game_html_logic.dart';

class GameHtmlBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameHtmlLogic());
  }
}
