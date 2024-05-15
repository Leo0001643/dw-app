import 'package:get/get.dart';
import 'package:leisure_games/app/controller/avatar_controller.dart';
import 'package:leisure_games/app/controller/wallet_controller.dart';

import 'main_logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainLogic());
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => AvatarController());

  }
}
