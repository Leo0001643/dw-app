import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';

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
    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username,
      "beginTime":"00:00:00","endTime":"23:59:59","beginDate":state.betRecordGroupRecord.value.time
      ,"endDate":state.betRecordGroupRecord.value.time,
    "cur":state.betRecordGroupRecord.value.cur,};
    var endTime = DateTime.now();
    var beginTime = endTime.subtract(const Duration(days: 7));
    params["beginDate"] = DateUtil.formatDateMs(beginTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    params["endDate"] = DateUtil.formatDateMs(endTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);

    HttpService.getRecordGroupDay(params).then((value) {
      state.record.value = value;
      state.record.refresh();
    });


  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
