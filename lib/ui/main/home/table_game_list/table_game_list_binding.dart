import 'package:get/get.dart';

import 'table_game_list_logic.dart';

class TableGameListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TableGameListLogic());
  }
}
