import 'package:get/get.dart';

import '../controllers/game_category_controller.dart';

class GameCategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameCategoryController());
  }
}
