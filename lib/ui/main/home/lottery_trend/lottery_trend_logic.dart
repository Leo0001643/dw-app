import 'dart:convert';

import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/history_hall_entity.dart';

import 'lottery_trend_state.dart';

class LotteryTrendLogic extends GetxController {
  final LotteryTrendState state = LotteryTrendState();

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
    HttpService.historyHall().then((value) {
      Map<String,dynamic> map = jsonDecode(value);
      map.forEach((key, value) {
        state.trendList.add(HistoryHall.fromJson(value));
      });
      loggerArray(["数据量达到多少了",state.trendList.em(),map.em()]);
      state.trendList.refresh();
    });
  }


  void clickGoucai(){
    if(AppData.isLogin()){
      Get.toNamed(Routes.room_list);
    } else {
      showToast(Intr().qingxiandenglu);
    }
  }

  void clickHistoryTrend(HistoryHall item) {
    if(isEmpty(DataUtils.getGameTypeByLid(item.lid))){
      showToast(Intr().jingqingqidai);
    }else {
      Get.toNamed(Routes.history_trend,arguments: item);
    }
  }





}
