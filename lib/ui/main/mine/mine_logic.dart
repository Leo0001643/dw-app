import 'package:get/get.dart';
import 'package:leisure_games/app/routes.dart';

import 'mine_state.dart';

class MineLogic extends GetxController {
  final MineState state = MineState();

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

  void clickItem(int index){
    switch(index){
      case 0:
        // Get.toNamed(Routes.coin_exchange);
        break;
      case 1:
        // Get.toNamed(Routes.quota_conversion);
        break;
      case 3:
        Get.toNamed(Routes.set_withdraw_pwd);
        break;
      case 4:
        Get.toNamed(Routes.bind_bank);
        break;
      case 5:
        Get.toNamed(Routes.bind_usdt);
        break;
      case 10:
        Get.toNamed(Routes.promotion_profit);
        break;
      case 11:
        Get.toNamed(Routes.proxy_register);
        break;
      case 12:
        Get.toNamed(Routes.setting);
        break;

    }
  }



}
