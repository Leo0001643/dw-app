import 'package:get/get.dart';

import 'chess_game_list_logic.dart';

class ChessGameListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChessGameListLogic());
  }
}
