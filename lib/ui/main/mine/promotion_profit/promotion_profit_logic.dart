import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/main/main_logic.dart';

import 'promotion_profit_state.dart';

class PromotionProfitLogic extends GetxController {
  final PromotionProfitState state = PromotionProfitState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() {

    //http://soptj9qq.com/#/register?sp=100001547
    //100001547

    state.userCode.value = "${AppData.user()?.id ?? 0}";

    state.userLink.value = "${Constants.host}/#/register?sp=${AppData.user()?.id ?? 0}";

    var user = AppData.user();
    var params = {"oid":user?.oid,"username":user?.username,"pageSize":Constants.pageSize,"page":1};

    HttpService.getSpreadPromos(params).then((value) {
      state.spreadPromos.assignAll(value.list ?? []);
    });


    HttpService.getSpreadUser(params).then((value) {
      state.spreadUser.assignAll(value);
    });

  }

  void clickTab(int index) {
    switch(index){
      case 0:
        state.showList.assignAll(state.spreadPromos);
        state.showList.refresh();
        break;
      case 1:
        state.showList.assignAll(state.spreadUser);
        state.showList.refresh();
        break;
    }
  }

}
