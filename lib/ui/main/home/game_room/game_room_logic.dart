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
import 'package:leisure_games/ui/main/home/game_room/bean/count_down_lottery_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_bet_result_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_lottery_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_msg_get_gif_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_msg_get_pic_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';
import 'package:leisure_games/ui/main/socket/app/app_inst.dart';
import 'package:leisure_games/ui/main/socket/app/center/impl/game_notification_center.dart';
import 'package:leisure_games/ui/main/socket/app/service/isolate_service.dart';
import 'package:leisure_games/ui/main/socket/app/ws_main_service.dart';
import 'package:leisure_games/ui/main/socket/game_data_service_center.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_game_odds_server.dart' as WS;
import 'game_room_state.dart';

class GameRoomLogic extends GetxController implements GameNotificationListener {
  final GameRoomState state = GameRoomState();
  ScrollController scrollController = ScrollController();
  RxString term = "".obs;
  WSLotteryEntityData? headWSLotteryEntityData;
  RxList<WS.Content> odds=<WS.Content>[].obs;
  Rx<LotteryStatus> currentStatus = LotteryStatus.initStatus.obs;

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
    });

    Future.delayed(Duration(seconds: 2), () {
      GameDataServiceCenter.instance.wSLogin(
          table_id: "${room.id ?? 0}",
          room_id: "${room.roomId ?? 0}",
          game_type: "${state.room.value.gameType}");
    });
    print("=========>room.id ${room.id}");
    HttpService.getPC28Odds(room.id.em()).then((value) {
      // loggerArray(["输出格式化数据处理",jsonEncode(value),]);
      Map<String, dynamic> map = jsonDecode(value,);
      odds.value=GameRuleUtil.getOddsbean(map).content??[];
    });

    ///表情
    HttpService.getExpression().then((value) {
      state.expressions.assignAll(value);
    });

    ///文字
    HttpService.getPhrase().then((value) {
      state.phrases.assignAll(value);
    });
    initTimer();

    TextItemLogic textItemLogic = Get.find<TextItemLogic>();
    // test();
    textItemLogic.countDownLotteryEntity.stream.listen((value) {
      print("修改了值");
      handleMessage(value);
    });

    textItemLogic.currentStatus.stream.listen((value) {
      print("修改了值");
      currentStatus.value = value;
      currentStatus.refresh();
      update(["gameRoomComputeWidget"]);
    });
    // test();
  }

  /**
   * 判断是不是登录了，如果登录成功，则重新登录ws
   */
  void isLoginToLogin() {
    if (!AppData.isLogin()) {}
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

  void test() {
    Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {
      GameResponse gameResponse = GameResponse();
      gameResponse.data = json;
      gameResponse.type = "closeOver";

      CountDownLotteryEntity item = CountDownLotteryEntity();
      // item.title="封盘信息";
      // item.titleColor=0xFFFC243B;
      // item.subTitile="开始封盘";
      // item.term="20251232131";
      // gameResponse.data=item;

      gameResponse.data = item;
      // handleSystemMessgeResult("closeOver",gameResponse);
    });
  }

  @override
  void notificationCallBack(GameResponse response) {
    print("------>response   ${response.data}");
    Map<String, dynamic> data = jsonDecode(response.data);
    String type = data["type"] ?? "";
    print("------>response  222");
    switch (type) {
      case "bet_result":
        handleBetResult(type, response);
        break;
      case "lottery":
        handleLottery(type, response);
        break;
      case "logout":
        break;
      case "msg_get_pic":
        handleMsgGetPic(response);
        break;
      case "msg_get_gif":
        handleMsgGetGif(response);
        break;
    }
  }

  @override
  bool supportHandleResponse(GameResponse response) {
    return true;
  }

  Timer? timer;
  int refershTime = 0;

  void initTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {});
  }

  @override
  void dispose() {
    timer?.cancel();
    AppInst.instance.stopWs();
    // TODO: implement dispose
    super.dispose();
  }

  void handleLottery(String type, GameResponse response) {
    WSLotteryEntity wsLotteryEntity =
        WSLotteryEntity.fromJson(jsonDecode(response.data));
    if (wsLotteryEntity.data?.isNotEmpty == true) {
      headWSLotteryEntityData = wsLotteryEntity.data?[0];
      term.value = headWSLotteryEntityData?.term ?? "";
      update(["gameRoomComputeWidget"]);
    }
    GameRoomItemEntity gameRoomItemEntity =
        GameRoomItemEntity(type: type, data: wsLotteryEntity);
    state.gameRoomItemEntityList.add(gameRoomItemEntity);
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
    update(["gameRoomLogicList"]);
  }

  void handleBetResult(String type, GameResponse response) {
    WsBetResultEntity result =
        WsBetResultEntity.fromJson(jsonDecode(response.data));
    if (AppData.user()?.username == result.username) {
    } else {}
    print("=====>3");
    GameRoomItemEntity gameRoomItemEntity =
        GameRoomItemEntity(type: type, data: result);
    state.gameRoomItemEntityList.add(gameRoomItemEntity);
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
    print("=====>4");
    update(["gameRoomLogicList"]);
  }

  void handleSystemMessgeResult(String type, GameResponse response) {
    GameRoomItemEntity gameRoomItemEntity =
        GameRoomItemEntity(type: type, data: response.data);

    state.gameRoomItemEntityList.add(gameRoomItemEntity);
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
    update(["gameRoomLogicList"]);
  }

  void handleMsgGetGif(GameResponse response) {
    WsMsgGetGifEntity result =
        WsMsgGetGifEntity.fromJson(jsonDecode(response.data));
  }

  void handleMsgGetPic(GameResponse response) {
    WsMsgGetPicEntity wsLotteryEntity =
        WsMsgGetPicEntity.fromJson(jsonDecode(response.data));
  }

  void handleMessage(CountDownLotteryEntity countDownLotteryEntity) {
    CountDownLotteryEntity item =
        CountDownLotteryEntity.fromJson(countDownLotteryEntity.toJson());
    GameResponse gameResponse = GameResponse();
    gameResponse.type = countDownLotteryEntity.type;
    gameResponse.data = item;
    term.value = item?.term ?? "";
    update(["gameRoomComputeWidget"]);
    handleSystemMessgeResult(gameResponse.type ?? "", gameResponse);
  }

  /**
   *  if (!LoginServiceProvider.isLogin()) {

      LoginServiceProvider.login(this, Observer {
      if (it != null && it) {
      ws.wsLoginMsg()
      btn_bet_show.performClick()
      }
      })
      return
      }
   */
  void startBet(BuildContext context) {
    // AppInst.instance.startWs();
    // 监听网络状态
    IsolateService? serv = AppInst.gameIsolate.mainService();
    if (serv != null && serv is WSMainService) {
      if (serv != null && serv is WSMainService) {
        serv.doWhenConnectCallBack(() {
          DialogUtils().showBulletBtmDialog(context, this, (v) {
            showToast("${v.length}");
          });
        }, onFail: () {
          showToast("链接服务失败，稍后再试");
        });
        return;
      }
    }
  }
}
