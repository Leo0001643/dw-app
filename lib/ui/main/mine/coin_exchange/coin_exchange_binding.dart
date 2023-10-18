import 'package:get/get.dart';

import 'coin_exchange_logic.dart';

class CoinExchangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoinExchangeLogic());
  }
}
