import 'package:get/get.dart';

import '../controllers/deposit_controller.dart';


class DepositBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DepositController());
  }
}
