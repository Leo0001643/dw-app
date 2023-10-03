
import 'package:generics/src/cashier/app_update/app_undate_controller.dart';
import 'package:get/get.dart';

class AppUndateBinding implements Bindings{

   @override
  void dependencies() {
    Get.lazyPut(() => AppUndateController());
  }
}