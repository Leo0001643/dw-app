import 'package:get/get.dart';

import '../controllers/recharge_online_controller.dart';


class RechargeOnlineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargeOnlineController());
  }
}
