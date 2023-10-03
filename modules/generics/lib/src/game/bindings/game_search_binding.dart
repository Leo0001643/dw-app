import 'package:get/get.dart';

import '../controllers/game_search_controller.dart';

class GameSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameSearchController());
  }
}
