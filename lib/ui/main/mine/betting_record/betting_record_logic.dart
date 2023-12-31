import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';

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
    // TODO: implement onClose
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
    var endTime = DateTime.now();
    var beginTime = endTime.subtract(const Duration(days: 7));
    params["beginDate"] = DateUtil.formatDateMs(beginTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);
    params["endDate"] = DateUtil.formatDateMs(endTime.millisecondsSinceEpoch,format: DateFormats.y_mo_d);

    HttpService.getRecordGroupDay(params).then((value) {
      state.record.value = value;
      state.record.refresh();
    });


  }



}
