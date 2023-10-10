import 'package:get/get.dart';

import 'select_currency_logic.dart';

class SelectCurrencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectCurrencyLogic());
  }
}
