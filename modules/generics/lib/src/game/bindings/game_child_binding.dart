import 'package:get/get.dart';

import '../controllers/game_child_controller.dart';

class GameCategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameChildController());
  }
}
