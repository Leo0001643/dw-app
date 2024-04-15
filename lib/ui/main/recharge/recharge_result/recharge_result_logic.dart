import 'package:get/get.dart';

import 'recharge_result_state.dart';

class RechargeResultLogic extends GetxController {
  final RechargeResultState state = RechargeResultState();

  @override
  void onReady() {
    state.result.value = Get.arguments;
    state.result.refresh();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }



}
