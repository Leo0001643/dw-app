import 'package:generics/src/cashier/backwater/bet_backwater_history_controller.dart';
import 'package:get/instance_manager.dart';

class BetBackwaterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BetBackwaterController());
  }
}
