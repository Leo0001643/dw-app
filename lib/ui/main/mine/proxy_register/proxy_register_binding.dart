import 'package:get/get.dart';

import 'proxy_register_logic.dart';

class ProxyRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProxyRegisterLogic());
  }
}
