import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/socket/socket_utils.dart';
import 'package:leisure_games/app/socket/ws_bet_entity.dart';
import 'package:leisure_games/app/socket/ws_lottery_entity.dart';
import 'package:leisure_games/app/socket/ws_message_get_entity.dart';
import 'package:leisure_games/app/utils/audio_utils.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/change_balance_event.dart';
import 'package:leisure_games/ui/bean/music_switch_event.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/count_down_lottery_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/game_room_item_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';
import 'package:leisure_games/ui/main/home/home_logic.dart';

import 'game_room_state.dart';
import 'room_tendency/room_tendency_logic.dart';

class GameRoomLogic extends GetxController {
  final GameRoomState state = GameRoomState();
  ScrollController scrollController = ScrollController();
  RxString term = "".obs;
  WSLotteryEntityData? headWSLotteryEntityData;
  // RxList<OddsContent> odds=<OddsContent>[].obs;

  static String  gameRoomCompute = "gameRoomComputeWidget";
  static String  gameRoomList = "gameRoomLogicList";

  StreamSubscription? textTimerListener;
  StreamSubscription? stopBettingListener;
  StreamSubscription? textStatusListener;
  StreamSubscription? musicSwitch;
  Timer? _timer;

  // RxList<OddsContent> dataBettingList=<OddsContent>[].obs;

  // RxList<OddsContent> selectBettingList=<OddsContent>[].obs;

  Rx<LotteryStatus> currentStatus = LotteryStatus.initStatus.obs;

  RxList<WSLotteryEntityData> recentlyWSLotteryEntityData=<WSLotteryEntityData>[].obs;
  ///更新开奖结果了
  var updateLottery = false;

  // RxDouble inputAmt = (0.0).obs;

  @override
  void onReady() {
    // loadBalance();
    TextItemLogic textItemLogic = Get.find<TextItemLogic>();
    // test();
    textTimerListener = textItemLogic.countDownLotteryEntity.stream.listen((value) {
      // print("修改了值");
      handleMessage(value);
    });
    textItemLogic.showWelcome();

    stopBettingListener = textItemLogic.showStopBetting.stream.listen((event) {
      print("=========>数据  ${event}  11   term  ${textItemLogic.countDownLotteryEntity.value.term??""}");
      textItemLogic.countDownLotteryEntity.value;
      term.value=textItemLogic.countDownLotteryEntity.value.term??"";
      headWSLotteryEntityData?.term=term.value;

      update([GameRoomLogic.gameRoomCompute]);
    });

    textStatusListener = textItemLogic.currentStatus.stream.listen((value) {
      // print("修改了值");
      currentStatus.value = value;
      currentStatus.refresh();
      update([gameRoomCompute]);
    });
    musicSwitch = eventBus.on<MusicSwitchEvent>().listen((event) {
      if(event.open){
        AudioUtils().playRoom();
      }else {
        AudioUtils().stopBg();
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    _timer?.cancel();
    AudioUtils().stop();
    AudioUtils().stopBg();
    musicSwitch?.cancel();
    textTimerListener?.cancel();
    textTimerListener = null;
    stopBettingListener?.cancel();
    stopBettingListener = null;
    textStatusListener?.cancel();
    textStatusListener = null;
    SocketUtils().destroy();
    super.onClose();
  }

  void onTabClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        ///这里是个有趣的现象，号源里用了粘性事件，所以重复打开会收到上次发送的事件，但是确意外跟web端达成了一致
        // behaviorBus.fire(SourceCheckEvent(""));
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

    startRoomCountDown(room);

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
      GameRuleUtil.getOddsbean(jsonDecode(value));
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

  // List<OddsContent>  getDataBettingList(int index,{int? type=0}){
  //   String mBallName="";
  //   switch(index) {
  //     case 0:
  //       mBallName = "tema";
  //       return GameRuleUtil.requestTema(odds,type:type);
  //     case 1:
  //       mBallName="first";
  //       break;
  //     case 2:
  //       mBallName="second";
  //       break;
  //     case 3:
  //       mBallName="three";
  //       break;
  //   }
  //   var dataBettingList = GameRuleUtil.dealData(odds,mBallName:mBallName);
  //   return dataBettingList;
  // }


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
    ///切换房间需要清除历史数据
    state.gameRoomItemEntityList.clear();
    update([gameRoomList]);

  }

  void startRoomCountDown(Pc28LottoRoomsTables room) {
    // 设置定时任务，每120秒执行一次
    _timer?.cancel();
    _timer = null;
    TextItemLogic? logic=Get.find<TextItemLogic>();
    var tag = "${room.gameType.em()}_${room.level.em()}_room_message";
    var roomWriting = isEmpty(state.roomWriting) ? null :  state.roomWriting.firstWhere((element) => element.tag == tag);
    loggerArray(["加载房间文案的数据l ",roomWriting]);
    logic.showOverTime(-1);///去掉倒计时
    logic.loadDataGameCode(room.gameType.em(),roomWriting);
    _timer = Timer.periodic(Duration(seconds: 50), (Timer timer) {
      logic.loadDataGameCode(room.gameType.em(),roomWriting);
    });
    logic.showWelcome();
  }

  Rx<BalanceEntity> getBalance(){
    return AppData.wallet() ? Get.find<HomeLogic>().state.cnyBal:Get.find<HomeLogic>().state.usdtBal;
  }

  // void loadBalance() {
  //   if(!AppData.isLogin()) return;
  //   var user = AppData.user();
  //   HttpService.getBalance({
  //     "cur": AppData.wallet() ? 1:5,
  //     "platform": "main",
  //     "oid": user?.oid,
  //     "username": user?.username
  //   }).then((value) {
  //     state.userBal.value = value;
  //     state.userBal.refresh();
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
  }

  ///开奖
  void handleLottery(WSLotteryEntity lottery) {
    // WSLotteryEntity wsLotteryEntity =
    //     WSLotteryEntity.fromJson(jsonDecode(response.data));
    recentlyWSLotteryEntityData.assignAll(lottery.data ?? []);
    ///开奖结果更新需要刷新趋势数据
    if(Get.isRegistered<RoomTendencyLogic>()){
      Get.find<RoomTendencyLogic>().loadData(state.room.value,loading: false);
    }
    if (recentlyWSLotteryEntityData.isNotEmpty) {
      ///这里取值需要深度拷贝，后面倒计时需要改这里的值
      headWSLotteryEntityData = WSLotteryEntityData.fromJson(lottery.data!.first.toJson());
      updateLottery = true;///更新开奖结果了
      update([gameRoomCompute]);
    }
    ///提示音
    if(AppData.promptTone()){ AudioUtils().playOpenResult(); }
    GameRoomItemEntity gameRoomItemEntity = GameRoomItemEntity(type: lottery.type, data: lottery);
    state.gameRoomItemEntityList.add(gameRoomItemEntity);
    update([gameRoomList]);

    Future.delayed(const Duration(milliseconds: 100),(){
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });

  }

  ///投注结果
  void handleBetResult(WsBetEntity entity) {
    print("=====>3");
    loggerArray(["投注信息打印",entity.toJson(),AppData.user()?.username]);
    if(entity.username == AppData.user()?.username){
      ///如果是自己投注成功 需要提示投注成功
      Future.delayed(const Duration(seconds: 1),(){
        showToast(Intr().touzhuchenggong);
      });
      ///还需要刷新用户余额
      eventBus.fire(ChangeBalanceEvent());
    }
    GameRoomItemEntity gameRoomItemEntity = GameRoomItemEntity(type: entity.type, data: entity);
    state.gameRoomItemEntityList.add(gameRoomItemEntity);
    update([gameRoomList]);

    Future.delayed(Duration(milliseconds: 100),(){
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
    print("=====>4");
  }

  ///系统消息
  void handleSystemMessgeResult(CountDownLotteryEntity entity) {
    GameRoomItemEntity gameRoomItemEntity = GameRoomItemEntity(type: entity.type, data: entity);
    state.gameRoomItemEntityList.add(gameRoomItemEntity);
    // loggerArray(["收到了系统消息",entity.toJson()]);
    update([gameRoomList]);
    Future.delayed(Duration(milliseconds: 100),(){
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  ///弹幕消息处理
  void handleMsgGetPic(WsMessageGetEntity entity) {
    state.barrageController.addBarrage(
      context: Get.context,
      barrageWidget: Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 3.w),
        child: Wrap(
          children: [
            GFAvatar(
              backgroundImage: WidgetUtils().buildImageProvider(
                  DataUtils.findAvatar(entity.avatar)),
              shape: GFAvatarShape.circle,
              radius: 10.r,
            ),
            SizedBox(width: 10.w,),
            Text.rich(TextSpan(
                children: entity.msg!.map((e) {
                  return e.isUrl() ?
                  WidgetSpan(child: WidgetUtils().buildImage(entity.msg!.first.em(), 15.r, 15.r))
                      : TextSpan(text: e.em(),style: TextStyle(fontSize: 12.sp,color: Colors.white,),);
                }).toList()
            )),
          ],
        ),
      ),
    );
    // state.barrageWallController.send([
    //   Bullet(
    //     child: LayoutBuilder(
    //       builder: (ctx,con){
    //         loggerArray(['看看约束',con.maxWidth,con.maxHeight,1.sw,1.sh]);
    //         return Container(
    //           decoration: BoxDecoration(
    //             color: Colors.black26,
    //             borderRadius: BorderRadius.circular(20.r),
    //           ),
    //           padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 3.w),
    //           child: Wrap(
    //             children: [
    //               GFAvatar(
    //                 backgroundImage: WidgetUtils().buildImageProvider(
    //                     DataUtils.findAvatar(entity.avatar)),
    //                 shape: GFAvatarShape.circle,
    //                 radius: 10.r,
    //               ),
    //               SizedBox(width: 10.w,),
    //               Text.rich(TextSpan(
    //                   children: entity.msg!.map((e) {
    //                     return e.isUrl() ?
    //                     WidgetSpan(child: WidgetUtils().buildImage(entity.msg!.first.em(), 15.r, 15.r))
    //                         : TextSpan(text: e.em(),style: TextStyle(fontSize: 12.sp,color: Colors.white,),);
    //                   }).toList()
    //               )),
    //             ],
    //           ),
    //         );
    //       },
    //     ),
    //   )
    // ]);
  }

  void handleMessage(CountDownLotteryEntity countDownLotteryEntity) {
    ///这里因为是监听的countDownLotteryEntity值的变化，所以不能直接加，需要深度拷贝，否则会造成页面数据显示混乱
    CountDownLotteryEntity item = CountDownLotteryEntity.fromJson(countDownLotteryEntity.toJson());
    // term.value = item.term.em();
    update([gameRoomCompute]);
    handleSystemMessgeResult(item);
  }

  //发送弹幕
  void sendBullet(BuildContext context) {
    // AppInst.instance.startWs();
    if(!AppData.isLogin()) return;
    DialogUtils().showBulletBtmDialog(context, this, (v) {
      Navigator.pop(context);
      if(unEmpty(v)){
        SocketUtils().sendMessage(v, state.room.value.gameType.em(), state.room.value.roomId.em().toString(), state.room.value.id.em().toString());
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



}
