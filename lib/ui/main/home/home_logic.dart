import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';

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
      case 0:
        DialogUtils().showLanguageDialog(context);
        break;
      case 1:
        DialogUtils().showCurrencyDialog(context);
        break;
      case 2:
        DialogUtils().showAccessRouteDialog(context);
        break;
      case 3:
        Get.toNamed(Routes.lottery_trend);
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
