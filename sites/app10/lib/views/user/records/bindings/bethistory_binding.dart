import 'package:get/get.dart';

import '../controllers/bet_history_controller.dart';

class BetHistoryBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BetHistoryController());
  }
}
