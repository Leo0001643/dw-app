import 'package:get/get.dart';

import 'bill_flow_logic.dart';

class BillFlowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillFlowLogic());
  }
}
