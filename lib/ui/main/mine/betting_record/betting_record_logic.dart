import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/data_utils.dart';

import 'betting_record_state.dart';

class BettingRecordLogic extends GetxController {
  final BettingRecordState state = BettingRecordState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadData() {
    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username,
    "beginTime":"00:00:00","endTime":"23:59:59"};

    if(state.currentWallet.value == state.wallets.first){
      params["cur"] = 1;
    } else {
      params["cur"] = 5;
    }

    var beginTime =  DateTime.now().subtract(const Duration(days: 6));
    var endTime = DateTime.now();
    params["beginDate"] = DataUtils.format12Hour(beginTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    params["endDate"] = DataUtils.format12Hour(endTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);

    HttpService.getRecordGroupDay(params).then((value) {
      state.record.value = value;
      state.record.refresh();
    });


  }



}
