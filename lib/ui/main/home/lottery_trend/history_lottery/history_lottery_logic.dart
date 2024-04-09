import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/refresh_change_notifier.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/main/home/lottery_trend/lottery_trend_logic.dart';

import 'history_lottery_state.dart';

class HistoryLotteryLogic extends GetxController {
  final HistoryLotteryState state = HistoryLotteryState();

  @override
  void onReady() {
    state.hall = Get.arguments;
    state.title.value = state.hall.name.em();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadData(bool refresh) {
    logger(state.hall.toJson());
    if(refresh){ state.page = 1; }
    HttpService.historyList(state.hall.lid.em(), state.page, Constants.pageSize).then((value) {
      state.page ++;
      RefreshChangeNotifier.loadData(refresh, state.refreshListener, state.list, value);
    }).catchError((e,stack){
      RefreshChangeNotifier.loadData(refresh, state.refreshListener, state.list, null);
    });
  }

  void clickGoucai(){
    Get.find<LotteryTrendLogic>().clickGoucai(state.hall);
  }


}
