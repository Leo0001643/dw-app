import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/audio_utils.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/bean/room_copy_writing_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/count_down_lottery_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_state.dart';
import 'package:scratcher/scratcher.dart';

enum LotteryStatus {
  //开始下注
  initStatus(-1),
  //倒计时
  fiveCountDownStatus(75),
  //开始下注
  startBettingStatus(6),
  //停止下注
  stopBettingStatus(6),
  //倒计时
  countDownStatus(7),
  //封盘
  sealingPlateStatus(8),
  //开盘
  openingQuotationStatus(9),
  //开奖中
  openLotteryStatus(10),
  //等待开盘
  wattingLotteryStatus(11);

  final int num;

  const LotteryStatus(this.num);
}

typedef TimerListener = Function(int showTime, LotteryStatus status);

/// 参考count_down_text.dart
class TextItemLogic extends GetxController {
  Rx<CountDownLotteryEntity> countDownLotteryEntity = CountDownLotteryEntity().obs;
  final TextTimerState state = TextTimerState();
  StreamSubscription? loginStream;
  // var count = 100;
  // String? type;
  String? status = Intr().fengpanzhong;
  String? lastStatusContent;
  int lastShowTime = -1;

  bool alreadyShowStop = false;
  Timer? countdownTimer;
  int fiveCountDownTime = -1;
  RxBool showStopBetting = false.obs;
  bool showStartBetting = false;
  bool firstShowStartBettingInPeriod = true;
  Rx<LotteryStatus> currentStatus = LotteryStatus.initStatus.obs;
  LotteryStatus lastStatus =LotteryStatus.initStatus;
  ///咪牌刮刮卡封面图
  var guaguaMask = ImageX.guaguaMask1P();
  ///刮刮卡状态控制器
  var scratchKey = GlobalKey<ScratcherState>();


  static String id_showStartBetting = "showStartBetting";
  static String id_showStopBetting = "showStopBetting";
  static String id_textTimerItem = "textTimerItem";
  static String id_fiveCountDownStatus = "fiveCountDownStatus";

  RoomCopyWritingEntity? roomWriting;


  setType(String? type) {
    // this.type = type;
  }

  TextItemLogic();
  // RxString term="".obs;

  // void loadData(GameKindGameKindList gameKind) {
  //   //测试用
  //   HttpService.getPc28LottoList().then((value) {
  //     print("==========>getPc28LottoList  ${jsonEncode(value.toJson())}");
  //     print("==========>item.gameCode  ${gameKind.gameCode}");
  //     for (Pc28LottoRooms item in value.rooms!) {
  //       // 判断 gameCode 和 gameType 是否相等
  //       if (gameKind.gameCode == item.gameType) {
  //         // 执行倒计时逻辑
  //         loadTimerData(item);
  //       }
  //     }
  //   });
  // }

  @override
  void onClose() {
    closeTimer();
    super.onClose();
  }


  void closeTimer(){
    countdownTimer?.cancel();
    countdownTimer = null;
  }


  // String gameCode="";
  void loadDataGameCode(String gameCode,RoomCopyWritingEntity? roomWriting) {
    this.roomWriting = roomWriting;
    closeTimer();
    loggerArray(["==========>loadDataGameCode  $roomWriting",gameCode]);
    //测试用
    HttpService.getPc28LottoList().then((value) {
      loggerArray(["==========>getPc28LottoList2  ${jsonEncode(value.toJson())}",gameCode]);
      // this.gameCode=gameCode;
      for (Pc28LottoRooms item in value.rooms!) {
        // 判断 gameCode 和 gameType 是否相等
        if (gameCode == item.gameType) {
          // 执行倒计时逻辑
          loadTimerData(item);
        }
      }
    });
  }

  void loadTimerData(Pc28LottoRooms pc28lottoRoom) {
    //请求倒计时
    HttpService.getPC28Plan(5).then((value) {
      print("==========>getPC28Plan  ${jsonEncode(value)}");
      _calculateCountdown(pc28lottoRoom, jsonDecode(value));
    });
  }

  void _calculateCountdown(
      Pc28LottoRooms pc28lottoRoom, Map<String,dynamic> pc28Plan) {
    closeTimer();
    print("==========>pc28lottoRoom  ${jsonEncode(pc28lottoRoom.toJson())}");
    // 服务器的误差时间
    var diffTime = pc28Plan['timestamp'] - DateTime.now().millisecondsSinceEpoch;

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      try {
        timeCountOnly(diffTime, pc28lottoRoom, pc28Plan);
      } catch (e,stack) {
        loggerArray(["loadTimerData22倒计时报错",e,stack]);
        closeTimer();
      }

      // 如果倒计时结束，取消计时器
      // if (count <= 0) {
      //   closeTimer();
      // }
    });
  }

  ///咪牌距离下一期投注倒计时
  var mipaiBetTime = "";
  var mipaiOpenTime = "";
  var waitOpenHint = Intr().dengdaikaipan;
  void timeCountOnly(
      diffTime, Pc28LottoRooms pc28lottoRoom,Map<String,dynamic> pc28Plan) {
    Map<String, dynamic> allTime = pc28Plan['all'];
    Map<String, dynamic> roomcountdown = {};
    // Map<String, dynamic> roominf = pc28lottoRoom.toJson();
    String key = pc28lottoRoom.gameType.toString();
    if (pc28lottoRoom.stateMsg != "0") {
      if (pc28lottoRoom.stateMsg == "1") {
        roomcountdown['${key}Time'] = Intr().weihuzhong;
      } else if (pc28lottoRoom.stateMsg == "3") {
        roomcountdown['${key}Time'] = Intr().yiguanpan;
      } else if (pc28lottoRoom.stateMsg == "4") {
        roomcountdown['${key}Time'] = Intr().yixiushi;
      }
      roomcountdown['${key}Term'] = '--';
      roomcountdown['${key}Notice'] = allTime[key]['msg'] ?? '';
      lastStatus=LotteryStatus.initStatus;
    } else if (allTime[key]['code'].toString() == "100020") {
      ///只有第一次需要显示，其他时候不需要
      if(currentStatus.value != LotteryStatus.wattingLotteryStatus){
        waitOpenHint = allTime[key]['msg'];
        showToastFull(waitOpenHint,toastLength: true);
      }
      currentStatus.value=LotteryStatus.wattingLotteryStatus;
      print("++++++++++++++++等待开盘");
      roomcountdown['${key}Time'] = Intr().dengdaikaipan;
      roomcountdown['${key}Term'] = '--';
      roomcountdown['${key}Notice'] = allTime[key]['msg'];
      lastStatus=LotteryStatus.wattingLotteryStatus;
    } else {
      resetStatusWhenStart();
      var data = allTime[key]['data'];
      if (data == null) {
        currentStatus.value=LotteryStatus.wattingLotteryStatus;
        print("++++++++++++++++等待开盘2");
        state.text_timer.value = Intr().dengdaikaipan;
        lastStatus=LotteryStatus.wattingLotteryStatus;
      } else if (data?.length > 1) {
        for (int s = 0; s < data.length - 1; s++) {
          String term= "${data[s]['term']}";
          //差异时间
          int onlineT = DateTime.now().millisecondsSinceEpoch + int.parse(diffTime.toString());
          //开始时间
          if (onlineT <= data[s + 1]['openTime']) {
            int openT =
                (int.parse(data[s + 1]['openTime'].toString()) - onlineT) ~/ 1000;
            roomcountdown['${key}OpenResult'] = openT;
            if (openT == 0) {
              roomcountdown['${key}OpenResult'] = Intr().kaijiangzhong;
            }
            //现在时间  小于关闭时间，大于开始时间， 则显示倒计时
            if (onlineT < data[s]['closeTime'] && onlineT > data[s]['openTime']) {
              currentStatus.value=LotteryStatus.countDownStatus;
              // print("显示倒计时");

              int rrtime = data[s]['closeTime'];
              int showT = (rrtime - onlineT) ~/ 1000;
              String showtime = secToTime(showT);
              roomcountdown['${key}Time'] = showtime;
              roomcountdown['${key}Term'] = data[s]['term'];

              showKeyCountTime(showT,term);

              showStartBettingTime(showT,term);
              if (showT <= 5 && showT >= 0) {
                showOverTime(showT);
              }
              lastShowTime = showT;
              lastStatus=LotteryStatus.countDownStatus;
              break;
            } else if (onlineT > data[s]['closeTime'] && onlineT < data[s + 1]['openTime']) {
              currentStatus.value=LotteryStatus.sealingPlateStatus;
              Get.find<GameRoomLogic>().updateLottery = false;
              //现在时间  大于关闭时间，小于下一期开奖时间， 则显示封盘中
              // print("fengpanzhong".tr);
              resetStatusWhenClosed();
              roomcountdown['${key}Time'] = Intr().fengpanzhong;
              roomcountdown['${key}Term'] = data[s]['term'];
              showStartBet(roomcountdown['${key}Time'],term);
              lastStatus=LotteryStatus.sealingPlateStatus;
              break;
            }
          }
        }
      } else if (data.length == 1) {
        currentStatus.value=LotteryStatus.countDownStatus;
        //倒计时长度为1 的情况
        print("==========倒计时长度为1");
        int onlineT = DateTime.now().millisecondsSinceEpoch + int.parse(diffTime.toString());
        if (onlineT < data[0]['closeTime'] && onlineT > data[0]['openTime']) {
          print("为1  倒计时");
          //现在时间  小于关闭时间，大于开始时间， 则显示倒计时
          int rrtime = data[0]['closeTime'];
          int showT = (rrtime - onlineT) ~/ 1000;
          String showtime = secToTime(showT);
          roomcountdown['${key}Time'] = showtime;
          roomcountdown['${key}Term'] = data[0]['term'];
          if (showT <= 5 && showT >= 0) {
            showOverTime(showT);
          } else {
            showOverTime(-1);
          }
          lastStatus=LotteryStatus.countDownStatus;
        } else if (onlineT < data[0]['openTime']) {
          resetStatusWhenClosed();

          //现在时间 opentime直接显示封盘中
          // print("为1  封盘中");
          roomcountdown['${key}Time'] = Intr().fengpanzhong;
          roomcountdown['${key}Term'] = data[0]['term'];
          lastStatus=LotteryStatus.sealingPlateStatus;
        }
      }
    }
    var roomLogic = Get.find<GameRoomLogic>();
    ///期号处理成功 显示期号
    roomLogic.term.value = isEmpty(roomcountdown['${key}Term']) ? "":roomcountdown['${key}Term'].toString();
    state.text_timer.value = roomcountdown['${key}Time'] ?? '';
    // if(showT == 50){
    //   showOpen(showT, data[0]['term']);
    // }
    // loggerArray(["期号倒计时结果",lastStatus,roomcountdown,]);

    lastStatusContent = roomcountdown['${key}Time'] ?? '';
    ///处理咪牌开奖逻辑 开始
    //如果是封盘中
    mipaiBetTime = currentStatus.value == LotteryStatus.sealingPlateStatus ? lastStatusContent! : subToTime(lastStatusContent!);
    if(LotteryStatus.wattingLotteryStatus == currentStatus.value){
      mipaiBetTime = Intr().dengdaikaipan;
    }
    //如果是开奖中
    mipaiOpenTime = roomcountdown['${key}OpenResult'].toString();

    // if(LotteryStatus.sealingPlateStatus == currentStatus.value){
    //   fengpanCount++;
    // }else if(LotteryStatus.wattingLotteryStatus != currentStatus.value){
    //   fengpanCount = -1;
    // }
    // if(LotteryStatus.sealingPlateStatus == currentStatus.value){
    //   mipaiTime = Intr().fengpanzhong;
    //   lotCount = 9 - fengpanCount;
    // } else if(LotteryStatus.wattingLotteryStatus == currentStatus.value){
    //   mipaiTime = Intr().dengdaikaipan;
    // }else {
    //   mipaiTime = subToTime(state.text_timer.value)??"";
    //   var timeParts = mipaiTime.split(":");
    //   if(timeParts.length == 2){
    //     lotCount = 10 + int.tryParse(timeParts.last).em();
    //   }
    // }
    // ///显示开奖中封面图
    if((int.tryParse(mipaiOpenTime)??0) <= 0 && guaguaMask != ImageX.lotteringP() && currentStatus.value != LotteryStatus.wattingLotteryStatus){
      guaguaMask = ImageX.lotteringP();
      ///重绘状态控制器
      scratchKey = GlobalKey<ScratcherState>();
    }
    ///如果有了封盘结果显示已有结果封面图
    if(roomLogic.updateLottery && guaguaMask != ImageX.guaguaMask1P()){
      guaguaMask = ImageX.guaguaMask1P();
      ///重绘状态控制器
      scratchKey = GlobalKey<ScratcherState>();
    }
    ///处理咪牌开奖逻辑 结束
    update([id_textTimerItem]);
  }

  // var fengpanCount = 0;

  String secToTime(int sec) {
    int hours = sec ~/ 3600;
    int minutes = (sec % 3600) ~/ 60;
    int seconds = sec % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String subToTime(String sec) {
    if (sec.length < 3) {
      return sec;
    }
    String result = sec.substring(2, sec.length);
    // print("result ${result}");
    return result;
  }

  //倒计时5s
  showOverTime(int second) {
    // logger("倒计时调用次数${second}");
    ///这里有second调用次数小于等于0的可能
    if(second > 0){
      ///提示音
      if(AppData.promptTone()){ AudioUtils().playCountDown(); }
    }
    fiveCountDownTime = second;
    update([id_fiveCountDownStatus]);
  }

  //
  // syschronizeStatus() {
  //   if (currentStatus.value != LotteryStatus.fiveCountDownStatus) {
  //     fiveCountDownTime = -1;
  //   }
  //   update([id_fiveCountDownStatus]);
  // }

  showStartBet(String currentStatus,String term) {
     if (lastStatusContent == "0:00:00" && currentStatus== Intr().fengpanzhong && alreadyShowStop == false) {
      showCloseOver(term);
      alreadyShowStop = true;
      showStopBetting.value = true;
      update(([id_showStopBetting]));
      Future.delayed(const Duration(seconds: 2,), () {
        showStopBetting.value = false;
        update(([id_showStopBetting]));
      });
    }
  }

  resetStatusWhenStart() {
    alreadyShowStop = false;
  }

  resetStatusWhenClosed() {
    firstShowStartBettingInPeriod = true;
  }

  showKeyCountTime(int showT,String term) {
    if ((showT == 60 || showT == 30 || showT == 10) &&
        (lastShowTime != showT)) {// showT == 15 ||
      countDownLotteryEntity.value.type = "countTime";
      countDownLotteryEntity.value.status = LotteryStatus.countDownStatus.name;
      countDownLotteryEntity.value.time = showT;
      countDownLotteryEntity.value.term = term;
      countDownLotteryEntity.value.titleColor = ColorX.text586().value;
      countDownLotteryEntity.value.title = "xitongxiaoxi".tr;
      if(showT == 60){
        countDownLotteryEntity.value.subTitile = roomWriting?.content?.countDown60.em();//"${"julifengpan".tr}${showT}${"miao".tr}";
      }else if(showT == 30){
        countDownLotteryEntity.value.subTitile = roomWriting?.content?.countDown30.em();//"${"julifengpan".tr}${showT}${"miao".tr}";
      }else {
        countDownLotteryEntity.value.subTitile = roomWriting?.content?.countDown10.em();//"${"julifengpan".tr}${showT}${"miao".tr}";
      }
      countDownLotteryEntity.refresh();
    }
  }

  void showWelcome() {
    loggerArray(['进入房间了开始讲话',roomWriting]);
    if (unEmpty(roomWriting)) {
    countDownLotteryEntity.value.type = "openOver";
    countDownLotteryEntity.value.title = "";//"kaishixiazhu".tr;
    countDownLotteryEntity.value.titleColor= ColorX.color_00ac47.value;
    countDownLotteryEntity.value.term = "";
    countDownLotteryEntity.value.subTitile = roomWriting?.content?.inertRoom.em();//"kaishixiazhu".tr;
    countDownLotteryEntity.value.status = LotteryStatus.sealingPlateStatus.name;
    countDownLotteryEntity.refresh();
    }
  }

  showOpen(int showT,String term) {
    loggerArray(['这里显示开始下注了m ',showT,term,currentStatus.value,roomWriting?.content?.beginBet.em()]);
    if (unEmpty(roomWriting)) {
      countDownLotteryEntity.value.type = "openOver";
      countDownLotteryEntity.value.title = Intr().kaishixiazhu;//"kaishixiazhu".tr;
      countDownLotteryEntity.value.titleColor= ColorX.color_00ac47.value;
      countDownLotteryEntity.value.term = term;
      countDownLotteryEntity.value.subTitile = roomWriting?.content?.beginBet.em();//"kaishixiazhu".tr;
      countDownLotteryEntity.value.status = LotteryStatus.sealingPlateStatus.name;
      countDownLotteryEntity.refresh();
    }
  }

  showCloseOver(String term) {
      countDownLotteryEntity.value.type = "closeOver";
      countDownLotteryEntity.value.title = Intr().fengpanxinxi;
      countDownLotteryEntity.value.titleColor= ColorX.color_fe2427.value;
      countDownLotteryEntity.value.term = term;
      countDownLotteryEntity.value.subTitile = roomWriting?.content?.openPlate.em();//Intr().kaishifengpan;
      countDownLotteryEntity.value.status = LotteryStatus.sealingPlateStatus.name;
      countDownLotteryEntity.refresh();
  }

  showStartBettingTime(int showT,String term) {
    // print(
    //     "=====>firstShowStartBettingInPeriod  ${firstShowStartBettingInPeriod}  showT  ${showT}");
    if (firstShowStartBettingInPeriod && showT > 45) {
      firstShowStartBettingInPeriod = false;
      showStartBetting = true;
      update(([id_showStartBetting]));
      ///显示开始下注消息
      showOpen(showT, term);
      ///提示音
      if(AppData.promptTone()){ AudioUtils().playNewKj(); }
      Future.delayed(Duration(seconds: 2,), () {
        showStartBetting = false;
        update(([id_showStartBetting]));
      });
    }
  }

  ///等待开奖和封盘中都不可投注
  String canBet(){
    if(currentStatus.value == LotteryStatus.sealingPlateStatus){
      return Intr().fengpanzhong;
    }else if(currentStatus.value == LotteryStatus.wattingLotteryStatus){
      return waitOpenHint;
    }else {
      return "";
    }
  }


}
