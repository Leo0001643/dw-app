import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/game_response.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_lottery_entity.dart';
import 'package:leisure_games/ui/main/socket/app/app_inst.dart';
import 'package:leisure_games/ui/main/socket/app/center/impl/game_notification_center.dart';
import 'package:leisure_games/ui/main/socket/app/service/isolate_service.dart';
import 'package:leisure_games/ui/main/socket/app/ws_main_service.dart';
import 'package:leisure_games/ui/main/socket/game_data_service_center.dart';
import 'package:leisure_games/ui/main/socket/game_isolate.dart';

import 'game_room_state.dart';

class GameRoomLogic extends GetxController  implements GameNotificationListener{
  final GameRoomState state = GameRoomState();
  WSLotteryEntityData? headWSLotteryEntityData;
  @override
  void onReady() {
    loadBalance();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void onTabClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.number_source);
        break;
      case 1:
        if (AppData.isLogin()) {
          Get.toNamed(Routes.betting_details);
        } else {
          showToast(Intr().qingxiandenglu);
        }
        break;
      case 2:
        DialogUtils().showSqueezeBtmDialog(context, this);
        break;
      case 3:
        Get.toNamed(Routes.room_tendency);
        break;
    }
  }

  Future<void> loadData(Pc28LottoRoomsTables room) async {
    AppInst.instance.startWs();
    // 监听网络状态
    IsolateService? serv = AppInst.gameIsolate.mainService();
    if (serv != null && serv is WSMainService) {
      serv.addResponseListener(this);
    } else {
      print("大厅系统监听消息失败！");
    }


    // GameDataServiceCenter.instance.startConnection(onConnected: () async {});
    loggerArray(["房型数据", state.room.toJson()]);
    state.roomType.value = room.level ?? 1;

    HttpService.getPc28LottoList().then((value) {
      state.pc28Lotto.value = value;
      state.pc28Lotto.refresh();
      changeRoomType(room);
    }) ;

    Future.delayed(Duration(seconds: 2),(){
      GameDataServiceCenter.instance.wSLogin(table_id:"${room.id??0}",room_id:"${ room.roomId??0}",game_type:"${state.room.value.gameType}" );
    });

    HttpService.getPC28Odds(room.id.em()).then((value) {
      // loggerArray(["输出格式化数据处理",jsonEncode(value),]);
      Map<String, dynamic> map = jsonDecode(
        value,
      );
    });

    ///表情
    HttpService.getExpression().then((value) {
      state.expressions.assignAll(value);
    });

    ///文字
    HttpService.getPhrase().then((value) {
      state.phrases.assignAll(value);
    });

    test();
  }
  /**
   * 判断是不是登录了，如果登录成功，则重新登录ws
   */
 void isLoginToLogin() {
  if (!AppData.isLogin()) {

  }

}




void connectWebSocket({Function? onConnected}) async {
    if (AppData.isLogin()) {
      // GameDataServiceCenter.instance.startConnection(onConnected: onConnected);
    }
  }

  void changeRoomType(Pc28LottoRoomsTables room) {
    state.pc28Lotto.value.rooms?.forEach((element) {
      if (element.gameType == room.gameType) {
        state.title.value = element.memo.em();
        state.room.value = room;
        state.roomType.value = room.level ?? 1;
        state.room.refresh();
      }
    });
  }

  void loadBalance() {
    var user = AppData.user();
    HttpService.getBalance({
      "cur": 1,
      "platform": "main",
      "oid": user?.oid,
      "username": user?.username
    }).then((value) {
      state.userBal.value = value;
      state.userBal.refresh();
    });
  }
  void test()
  {
    Timer timer=Timer(Duration(seconds: 6), () {
      var json="{\"data\":[{\"originalNum\":\"758\",\"gameType\":\"fastbtb28\",\"billCount\":\"0\",\"closeTime\":\"1705576550000\",\"term\":\"202401181156\",\"state\":\"0\",\"openTime\":\"1705576560000\",\"luckyNum\":\"20\"},{\"originalNum\":\"772\",\"gameType\":\"fastbtb28\",\"billCount\":\"0\",\"closeTime\":\"1705576490000\",\"term\":\"202401181155\",\"state\":\"0\",\"openTime\":\"1705576500000\",\"luckyNum\":\"16\"},{\"originalNum\":\"073\",\"gameType\":\"fastbtb28\",\"billCount\":\"0\",\"closeTime\":\"1705576430000\",\"term\":\"202401181154\",\"state\":\"0\",\"openTime\":\"1705576440000\",\"luckyNum\":\"10\"},{\"originalNum\":\"601\",\"gameType\":\"fastbtb28\",\"billCount\":\"0\",\"closeTime\":\"1705576370000\",\"term\":\"202401181153\",\"state\":\"0\",\"openTime\":\"1705576380000\",\"luckyNum\":\"7\"},{\"originalNum\":\"420\",\"gameType\":\"fastbtb28\",\"billCount\":\"0\",\"closeTime\":\"1705576310000\",\"term\":\"202401181152\",\"state\":\"0\",\"openTime\":\"1705576320000\",\"luckyNum\":\"6\"},{\"originalNum\":\"770\",\"gameType\":\"fastbtb28\",\"billCount\":\"0\",\"closeTime\":\"1705576250000\",\"term\":\"202401181151\",\"state\":\"0\",\"openTime\":\"1705576260000\",\"luckyNum\":\"14\"},{\"originalNum\":\"654\",\"gameType\":\"fastbtb28\",\"billCount\":\"0\",\"closeTime\":\"1705576190000\",\"term\":\"202401181150\",\"state\":\"0\",\"openTime\":\"1705576200000\",\"luckyNum\":\"15\"},{\"originalNum\":\"330\",\"gameType\":\"fastbtb28\",\"billCount\":\"0\",\"closeTime\":\"1705576130000\",\"term\":\"202401181149\",\"state\":\"0\",\"openTime\":\"1705576140000\",\"luckyNum\":\"6\"},{\"originalNum\":\"278\",\"gameType\":\"fastbtb28\",\"billCount\":\"0\",\"closeTime\":\"1705576070000\",\"term\":\"202401181148\",\"state\":\"0\",\"openTime\":\"1705576080000\",\"luckyNum\":\"17\"},{\"originalNum\":\"903\",\"gameType\":\"fastbtb28\",\"billCount\":\"0\",\"closeTime\":\"1705576010000\",\"term\":\"202401181147\",\"state\":\"0\",\"openTime\":\"1705576020000\",\"luckyNum\":\"12\"}],\"time\":1705576582,\"type\":\"lottery\",\"status\":\"10000\"}";
      GameResponse gameResponse=GameResponse();
      gameResponse.data=json;
      gameResponse.type="lottery";
      notificationCallBack(gameResponse);

    });

  }
  @override
  void notificationCallBack(GameResponse response) {
    print("------>response   ${response.data}");
    switch(response.type) {
      case "bet_result":

        break;
      case "lottery":
        handleLottery(response);
        break;
      case "logout":

        break;
      case "msg_get_pic":

        break;
      case "msg_get_gif":

        break;

    }

  }

  @override
  bool supportHandleResponse(GameResponse response) {
    return false;
  }

  void handleLottery(GameResponse response) {
    WSLotteryEntity wsLotteryEntity=WSLotteryEntity.fromJson(jsonDecode(response.data));
    if(wsLotteryEntity.data?.isNotEmpty==true) {
      headWSLotteryEntityData=wsLotteryEntity.data?[0];
      update(["gameRoomComputeWidget"]);

    }

  }

//
}
