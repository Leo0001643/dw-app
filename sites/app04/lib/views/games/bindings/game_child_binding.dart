import 'package:app04/views/games/controllers/game_category_controller.dart';
import 'package:app04/views/games/controllers/game_child_controller.dart';
import 'package:get/get.dart';

class GameCategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameChildController());
  }
}
