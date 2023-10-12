import 'package:get/get.dart';
import 'package:leisure_games/app/routes.dart';

import 'customer_service_state.dart';

class CustomerServiceLogic extends GetxController {
  final CustomerServiceState state = CustomerServiceState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void clickService(int index){
    Get.toNamed(Routes.service_details);
  }




}
