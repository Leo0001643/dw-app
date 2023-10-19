import 'package:get/get.dart';

import 'member_rebate_logic.dart';

class MemberRebateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberRebateLogic());
  }
}
