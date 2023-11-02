import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

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

  void clickMenu(BuildContext context,int index){
    switch(index){
      case 0:///充值
        // DialogUtils().showLanguageDialog(context);
      eventBus.fire(ChangeMainPageEvent(2));
        break;
      case 1:///提现
        // DialogUtils().showCurrencyDialog(context);
      Get.toNamed(Routes.withdraw);
        break;
      case 2:///抽奖
        // DialogUtils().showAccessRouteDialog(context);
        Get.toNamed(Routes.points_lottery);
        break;
      case 3:///走势
        Get.toNamed(Routes.lottery_trend);
        break;
      case 4:///签到抽奖
        Get.toNamed(Routes.sign_in);
        break;
      case 5:///优惠活动
        eventBus.fire(ChangeMainPageEvent(1));
        break;
      case 6:///推荐有礼
        Get.toNamed(Routes.promotion_profit);
        break;
    }

  }


  void clickInfo(BuildContext context,int index){
    switch(index){
      case 0:

        break;
      case 1:

        break;
      case 2:

        break;
      case 3:

        break;
    }

  }


}
