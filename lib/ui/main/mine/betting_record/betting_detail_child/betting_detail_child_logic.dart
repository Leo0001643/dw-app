import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/bet_detail_list_entity.dart';
import 'package:leisure_games/ui/bean/bet_record_group_entity.dart';

import 'betting_detail_child_state.dart';

class BettingDetailChildLogic extends GetxController {
  final BettingDetailChildState state = BettingDetailChildState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  void loadData() {
    state.betRecordGroupRecord.value=BetRecordGroupRecord.fromJson(Get.arguments["origin"]??"");
    state.betDetailItemEntity.value=BetDetailListRecordRecord.fromJson(Get.arguments["data"]??"");
    state.title.value= state.betDetailItemEntity.value.gameName??"";
    state.title.refresh();
    loggerArray(["打印下这个页面数据b",state.betRecordGroupRecord.value.toJson(),state.betDetailItemEntity.value.toJson()]);
    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username,
      "beginTime":"00:00:00","endTime":"23:59:59","beginDate":state.betRecordGroupRecord.value.time
      ,"endDate":state.betRecordGroupRecord.value.time,
    "cur":state.betRecordGroupRecord.value.cur,
    "gameKind":"${state.betDetailItemEntity.value.gameKind}",
      "gameType":"${state.betDetailItemEntity.value.gameType}",
      "pageLimit":500,
      "page":1,
    };
    // var endTime = DateTime.now();
    // var beginTime = endTime.subtract(const Duration(days: 6));
    // params["beginDate"] = DataUtils.format12Hour(beginTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    // params["endDate"] = DataUtils.format12Hour(endTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);

    HttpService.getRecordDetailNew(params).then((value) {
      state.record.value = value;
      state.record.refresh();
    });
  }



  @override
  void onClose() {
    super.onClose();
  }


}
