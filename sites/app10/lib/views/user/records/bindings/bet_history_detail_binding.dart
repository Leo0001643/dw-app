import 'package:app10/views/user/records/controllers/bet_history_detail_controller.dart';
import 'package:get/get.dart';

class BetHistoryDetailBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BetHistoryDetailController());
  }
}
