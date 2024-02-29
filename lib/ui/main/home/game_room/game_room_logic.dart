import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_barrage/flutter_barrage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/socket/socket_utils.dart';
import 'package:leisure_games/app/socket/ws_bet_entity.dart';
import 'package:leisure_games/app/socket/ws_lottery_entity.dart';
import 'package:leisure_games/app/socket/ws_message_get_entity.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/count_down_lottery_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/odds_content.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';

import 'game_room_state.dart';

class GameRoomLogic extends GetxController {
  final GameRoomState state = GameRoomState();
  ScrollController scrollController = ScrollController();
  RxString term = "".obs;
  WSLotteryEntityData? headWSLotteryEntityData;
  RxList<OddsContent> odds=<OddsContent>[].obs;

  // RxList<OddsContent> dataBettingList=<OddsContent>[].obs;

  // RxList<OddsContent> selectBettingList=<OddsContent>[].obs;

  Rx<LotteryStatus> currentStatus = LotteryStatus.initStatus.obs;

  RxList<WSLotteryEntityData> recentlyWSLotteryEntityData=<WSLotteryEntityData>[].obs;

  // RxDouble inputAmt = (0.0).obs;

  @override
  void onReady() {
    loadBalance();
    TextItemLogic textItemLogic = Get.find<TextItemLogic>();
    // test();
    textItemLogic.countDownLotteryEntity.stream.listen((value) {
      // print("修改了值");
      handleMessage(value);
    });

    textItemLogic.currentStatus.stream.listen((value) {
      // print("修改了值");
      currentStatus.value = value;
      currentStatus.refresh();
      update(["gameRoomComputeWidget"]);
    });
    super.onReady();
  }

  @override
  void onClose() {
    // timer?.cancel();
    SocketUtils().destroy();
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
        Get.toNamed(Routes.room_tendency,arguments: state.room.value);
        break;
    }
  }

  Future<void> loadData(Pc28LottoRoomsTables room,bool login) async {
    ///处理房间房型显示 长连接连接问题
    changeRoomType(room,login);

    HttpService.getPc28LottoList().then((value) {
      value.rooms?.forEach((e1) {
        e1.tables?.forEach((e2) {
          e2.title = e1.memo.em();
        });
      });
      state.pc28Lotto.value = value;
      state.pc28Lotto.refresh();
    });

    HttpService.getPC28Odds(room.id.em()).then((value) {
      // loggerArray(["输出格式化数据处理",jsonEncode(value),]);
      Map<String, dynamic> map = jsonDecode(value);
      GameRuleUtil.getOddsbean(map).then((list) {
        odds.value= list;
      });
    });

    ///表情
    HttpService.getExpression().then((value) {
      state.expressions.assignAll(value);
    });

    ///文字
    HttpService.getPhrase().then((value) {
      state.phrases.assignAll(value);
    });
  }

  List<OddsContent>  getDataBettingList(int index,{int? type=0}){
    String mBallName="";
    switch(index) {
      case 0:
        mBallName = "tema";
        return GameRuleUtil.requestTema(odds,type:type);
      case 1:
        mBallName="first";
        break;
      case 2:
        mBallName="second";
        break;
      case 3:
        mBallName="three";
        break;
    }
    var dataBettingList = GameRuleUtil.dealData(odds,mBallName:mBallName);
    return dataBettingList;
  }


  void changeRoomType(Pc28LottoRoomsTables room,bool login) {
    loggerArray(["切换彩种",room.toJson()]);
    state.title.value = room.title.em();
    state.room.value = room;
    state.roomType.value = room.level ?? 1;
    state.room.refresh();
    if(login){
      SocketUtils().connect(callback: (){
        ///开始登录房间
        SocketUtils().loginRoom(room.gameType.em(), room.roomId.em().toString(), room.id.em().toString());
      });
    }else {///切换房间
      SocketUtils().changeRoom(room.gameType.em(), room.roomId.em().toString(), room.id.em().toString());
    }
    ///切换房间需要清楚历史数据
    state.gameRoomItemEntityList.clear();
    update(["gameRoomLogicList"]);

  }

  void loadBalance() {
    if(!AppData.isLogin()) return;

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

  @override
  void dispose() {
    super.dispose();
  }

  void handleLottery(WSLotteryEntity lottery) {
    // WSLotteryEntity wsLotteryEntity =
    //     WSLotteryEntity.fromJson(jsonDecode(response.data));
    recentlyWSLotteryEntityData.value=lottery.data??[];
    if (lottery.data?.isNotEmpty == true) {
      headWSLotteryEntityData = lottery.data?[0];
      term.value = headWSLotteryEntityData?.term ?? '';
      update(["gameRoomComputeWidget"]);
    }
    GameRoomItemEntity gameRoomItemEntity = GameRoomItemEntity(type: lottery.type, data: lottery);
    state.gameRoomItemEntityList.add(gameRoomItemEntity);
    update(["gameRoomLogicList"]);

    Future.delayed(const Duration(milliseconds: 100),(){
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });

  }

  void handleBetResult(WsBetEntity entity) {
    print("=====>3");
    loggerArray(["投注信息打印",entity.toJson()]);
    GameRoomItemEntity gameRoomItemEntity =
        GameRoomItemEntity(type: entity.type, data: entity);
    state.gameRoomItemEntityList.add(gameRoomItemEntity);
    update(["gameRoomLogicList"]);

    Future.delayed(Duration(milliseconds: 100),(){
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
    print("=====>4");
  }

  void handleSystemMessgeResult(CountDownLotteryEntity entity) {
    GameRoomItemEntity gameRoomItemEntity =
        GameRoomItemEntity(type: entity.type, data: entity);
    state.gameRoomItemEntityList.add(gameRoomItemEntity);
    update(["gameRoomLogicList"]);
    Future.delayed(Duration(milliseconds: 100),(){
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  ///弹幕消息处理
  void handleMsgGetPic(WsMessageGetEntity entity) {
    state.barrageWallController.send([
      Bullet(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 3.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GFAvatar(
                backgroundImage: WidgetUtils().buildImageProvider(
                    DataUtils.findAvatar(entity.avatar)),
                shape: GFAvatarShape.circle,
                radius: 10.r,
              ),
              SizedBox(width: 10.w,),
              Visibility(
                visible: unEmpty(entity.msg),
                child: entity.msg!.first.isUrl() ?
                WidgetUtils().buildImage(entity.msg!.first.em(), 15.r, 15.r)
                    : Text(entity.msg!.first.em(),style: TextStyle(fontSize: 12.sp,color: Colors.white),),
              )
            ],
          ),
        ),
      )
    ]);
  }

  void handleMessage(CountDownLotteryEntity countDownLotteryEntity) {
    CountDownLotteryEntity item =
        CountDownLotteryEntity.fromJson(countDownLotteryEntity.toJson());
    term.value = item.term ?? "";
    update(["gameRoomComputeWidget"]);
    handleSystemMessgeResult(countDownLotteryEntity);
  }


  void startBet(BuildContext context) {
    // AppInst.instance.startWs();
    if(!AppData.isLogin()) return;
    DialogUtils().showBulletBtmDialog(context, this, (v) {
      Navigator.pop(context);
      if(unEmpty(v)){
        for (var element in (v as List<dynamic>)) {
          SocketUtils().sendMessage(element, state.room.value.gameType.em(), state.room.value.roomId.em().toString(), state.room.value.id.em().toString());
        }
      }
    });
  }

  void sumbitBets(String? moneyType, String? nowTerm, List<WsBetContent> betList,) {
    if(LotteryStatus.sealingPlateStatus==currentStatus.value) {
      showToast(Intr().fengpanzhong);
      return;
    }
    SocketUtils().toBet(moneyType, nowTerm, betList, state.room.value.gameType.em(),
        state.room.value.roomId.em().toString(), state.room.value.id.em().toString());
    // showToast(Intr().caozuochenggong);

  }


      // {key: bet, value: {"type":"bet","client_name":"dsa0001","room_id":"18","oid":"41992217e761ab8c8ad8a003e58bfb16","table_id":"54","site_id":"9000","game_type":"fastbtb28","now_term":"202402270636","moneyType":"CNY","content":[{"money":"1.0","num":"","odds":"8.777","odds_1314":null,"type":"second_cao_3"},{"money":"1.0","num":"","odds":"8.666","odds_1314":null,"type":"first_cao_2"},{"money":"1.0","num":"","odds":"1.884","odds_1314":"1.555","type":"even"}]}}

//[log] [长连接发送投注消息, {key: bet, value: {"type":"bet","client_name":"dsa0001","room_id":"18","oid":"41992217e761ab8c8ad8a003e58bfb16","table_id":"54","site_id":"9000","game_type":"fastbtb28","now_term":"202402270643","moneyType":"CNY","content":[{"money":"20","num":"","odds":"1.881","odds_1314":"1.888","type":"big"},{"money":"20","num":"","odds":"1.882","odds_1314":"1.777","type":"small"},{"money":"20","num":"","odds":"1.883","odds_1314":"1.666","type":"odd"},{"money":"20","num":"","odds":"1.884","odds_1314":"1.555","type":"even"}]}}]
}
