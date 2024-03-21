import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_entity.dart';

import 'betting_detail_state.dart';

class BettingDetailLogic extends GetxController {
  final BettingDetailState state = BettingDetailState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadData();
  }
  void loadData() {
    state.title.value= state.betRecordGroupRecord.value.title??"";
    state.title.refresh();
    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username,
      "beginTime":"00:00:00","endTime":"23:59:59","beginDate":state.betRecordGroupRecord.value.time
      ,"endDate":state.betRecordGroupRecord.value.time,
    "cur":state.betRecordGroupRecord.value.cur,};
    var endTime = DateTime.now();
    var beginTime = endTime.subtract(const Duration(days: 7));
    params["beginDate"] = DataUtils.format12Hour(beginTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    params["endDate"] = DataUtils.format12Hour(endTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);

    HttpService.getRecordGroupType(params).then((value) {
      state.record.value = value;
      for(BetDetailItemEntity item in value.record??[]) {
        state?.betamount.value=((item?.betamount??0)+ state.betamount.value).toDouble();
        state?.validamount.value=((item?.validamount??0)+ state.validamount.value).toDouble();
        state?.winlose.value=((item?.winlose??0)+ state.winlose.value).toDouble();
        state?.betCount.value=((item?.betCount??0)+ state.betCount.value).toInt();
      }
      state.record.refresh();
    });


  }
  void setCurrentBet(BetDetailItemEntity? value) {
    state.record.value = value??BetDetailItemEntity();
    state?.betamount.value=0;
    state?.validamount.value=0;
    state?.winlose.value=0;
    state?.betCount.value=0;
    state.title.value= value?.gameName??value?.gameKindName??"";
    for(BetDetailItemEntity item in value?.record??[]) {
      state?.betamount.value=((item?.betamount??0)+ state.betamount.value).toDouble();
      state?.validamount.value=((item?.validamount??0)+ state.validamount.value).toDouble();
      state?.winlose.value=((item?.winlose??0)+ state.winlose.value).toDouble();
      state?.betCount.value=((item?.betCount??0)+ state.betCount.value).toInt();
    }
    state.record.refresh();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


}
