import 'dart:convert';

import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
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
      var list = List<HistoryHall>.empty(growable: true);
      map.forEach((key, value) {
        // logger("这都是多少呢${key} == ${value["lid"]}");
        list.add(HistoryHall.fromJson(value));
      });
      var blackList = ["33","34","46"];
      state.trendList.value = list.where((element) => !blackList.contains(element.lid.toString())).toList(growable: true);
      state.trendList.sort((a, b) => int.tryParse(a.sort.em()).em() - int.tryParse(b.sort.em()).em());
      state.trendList.refresh();
    });
  }


  void clickGoucai(HistoryHall item){
    if(AppData.isLogin()){
      var gameCode = state.PC28HashTable[item.lid.toString()];
      if(isEmpty(gameCode)){//跳转经典彩
        // loggerArray(["打印点击去购彩的详情",item.toJson()]);
        WidgetUtils().jumpGameRoom(Get.context!, GameKindEntity(), GameKindGameKindList(gameCode: "${item.lid.em()}",liveName: "jingdian_lotto",tags: "ds_lotto_jd"));
        return;
      }
      logger(state.PC28HashTable[item.lid.em()]);
      Get.toNamed(Routes.room_list,arguments: GameKindGameKindList(gameCode: gameCode));
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
