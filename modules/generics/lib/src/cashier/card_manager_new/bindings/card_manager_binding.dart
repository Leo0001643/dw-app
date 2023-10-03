import 'package:get/get.dart';

import '../controllers/card_manager_logic.dart';

class CardManagerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CardManagerChildLogic());
  }
}
