import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/back_water_entity.dart';
import 'package:leisure_games/ui/bean/day_return_water_details_params.dart';

import 'bet_amount_rebate_state.dart';

class BetAmountRebateLogic extends GetxController {
  final BetAmountRebateState state = BetAmountRebateState();

  @override
  void onReady() {
    loadData(Get.arguments);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData(DayReturnWaterDetailsParams item) {
    state.params.value = item;
    state.params.refresh();

    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username};

    ///游戏类型【1:PC28,2:DS】
    params["gameType"] = item.details?.gameType?.toUpperCase() == Constants.PC28 ? 1:2;
    params["mark"] = "1";
    params["beginDate"] = item.beginDate;
    params["endDate"] = item.endDate;

    HttpService.dayReturnWaterDetails(params).then((value) {
      state.record.value = value;
      state.record.refresh();
    });

  }



}
