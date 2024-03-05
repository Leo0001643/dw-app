import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/bean/pc28_plan_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/count_down_lottery_entity.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_state.dart';

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

/**
 * 参考count_down_text.dart
 */
class TextItemLogic extends GetxController {
  Rx<CountDownLotteryEntity> countDownLotteryEntity = CountDownLotteryEntity().obs;
  final TextTimerState state = TextTimerState();
  StreamSubscription? loginStream;
  var count = 100;
  String? type;
  String? status = Intr().fengpanzhong;
  String? lastStatusContent;
  int lastShowTime = -1;

  bool alreadyShowStop = false;
  Timer? countdownTimer;
  int fiveCountDownTime = -1;
  bool showStopBetting = false;
  bool showStartBetting = false;
  bool firstShowStartBettingInPeriod = true;
  Rx<LotteryStatus> currentStatus = LotteryStatus.initStatus.obs;
  LotteryStatus lastStatus =LotteryStatus.initStatus;
  setType(String? type) {
    this.type = type;
  }

  TextItemLogic({this.type});
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


  // String gameCode="";
  void loadDataGameCode(String gameCode) {
    //测试用
    HttpService.getPc28LottoList().then((value) {
      print("==========>getPc28LottoList2  ${jsonEncode(value.toJson())}");
      print("==========>item.gameCode2  ${gameCode}");
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
    countdownTimer?.cancel();
    print("==========>pc28lottoRoom  ${jsonEncode(pc28lottoRoom.toJson())}");
    // 服务器的误差时间
    var diffTime = pc28Plan['timestamp'] - DateTime.now().millisecondsSinceEpoch;

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      try {
        timeCountOnly(diffTime, pc28lottoRoom, pc28Plan);
      } catch (e) {
        print("loadTimerData22  倒计时  报错  ${e.toString()}");
      }

      // 如果倒计时结束，取消计时器
      if (count <= 0) {
        countdownTimer?.cancel();
      }
    });
  }

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
    } else if (allTime[key]['code'] == 100020) {
      currentStatus.value=LotteryStatus.wattingLotteryStatus;
      print("++++++++++++++++等待开盘");
      roomcountdown['${key}Time'] = Intr().dengdaikaipan;
      roomcountdown['${key}Term'] = '--';
      roomcountdown['${key}Notice'] = allTime[key]['msg'];

      lastStatus=LotteryStatus.wattingLotteryStatus;
    } else {
      resetStatusWhenStart();
      if (allTime[key]['data'] == null) {
        currentStatus.value=LotteryStatus.wattingLotteryStatus;
        print("++++++++++++++++等待开盘2");
        state.text_timer.value = Intr().dengdaikaipan;
        lastStatus=LotteryStatus.wattingLotteryStatus;
      }
      if (allTime[key]['data']?.length > 1) {
        for (int s = 0; s < allTime[key]['data'].length - 1; s++) {
          String term= "${allTime[key]['data'][s]['term']}";
          //差异时间
          int onlineT = DateTime.now().millisecondsSinceEpoch +
              int.parse(diffTime.toString());
          //开始时间
          if (onlineT <= allTime[key]['data'][s + 1]['openTime']) {
            int openT =
                (int.parse(allTime[key]['data'][s + 1]['openTime'].toString()) - onlineT) ~/ 1000;
            roomcountdown['${key}OpenResult'] = openT;
            if (openT == 0) {
              roomcountdown['${key}OpenResult'] = Intr().kaijiangzhong;
            }
            //现在时间  小于关闭时间，大于开始时间， 则显示倒计时
            if (onlineT < allTime[key]['data'][s]['closeTime'] &&
                onlineT > allTime[key]['data'][s]['openTime']) {
              currentStatus.value=LotteryStatus.countDownStatus;
              // print("显示倒计时");

              int rrtime = allTime[key]['data'][s]['closeTime'];
              int showT = (rrtime - onlineT) ~/ 1000;
              String showtime = secToTime(showT);
              roomcountdown['${key}Time'] = showtime;
              roomcountdown['${key}Term'] = allTime[key]['data'][s]['term'];

              showKeyCountTime(showT,term);

              showStartBettingTime(showT);
              if (showT <= 5) {
                showOverTime(showT);
              }
              lastShowTime = showT;
              lastStatus=LotteryStatus.countDownStatus;
              break;
            } else if (onlineT > allTime[key]['data'][s]['closeTime'] &&
                onlineT < allTime[key]['data'][s + 1]['openTime']) {
              currentStatus.value=LotteryStatus.sealingPlateStatus;
              //现在时间  大于关闭时间，小于下一期开奖时间， 则显示封盘中
              // print("fengpanzhong".tr);
              resetStatusWhenClosed();
              roomcountdown['${key}Time'] = Intr().fengpanzhong;
              roomcountdown['${key}Term'] = allTime[key]['data'][s]['term'];
              showStartBet(roomcountdown['${key}Time'],term);
              lastStatus=LotteryStatus.sealingPlateStatus;
              break;
            }
          }
        }
      } else if (allTime[key]['data'].length == 1) {
        currentStatus.value=LotteryStatus.countDownStatus;
        //倒计时长度为1 的情况
        print("==========倒计时长度为1");
        int onlineT = DateTime.now().millisecondsSinceEpoch + int.parse(diffTime.toString());
        if (onlineT < allTime[key]['data'][0]['closeTime'] &&
            onlineT > allTime[key]['data'][0]['openTime']) {
          print("为1  倒计时");
          //现在时间  小于关闭时间，大于开始时间， 则显示倒计时
          int rrtime = allTime[key]['data'][0]['closeTime'];
          int showT = (rrtime - onlineT) ~/ 1000;
          if (showT <= 5) {
            showOverTime(showT);
          } else {
            showOverTime(-1);
          }
          String showtime = secToTime(showT);
          roomcountdown['${key}Time'] = showtime;
          roomcountdown['${key}Term'] = allTime[key]['data'][0]['term'];
          lastStatus=LotteryStatus.countDownStatus;
        } else if (onlineT < allTime[key]['data'][0]['openTime']) {
          resetStatusWhenClosed();

          //现在时间 opentime直接显示封盘中
          // print("为1  封盘中");
          roomcountdown['${key}Time'] = Intr().fengpanzhong;
          roomcountdown['${key}Term'] = allTime[key]['data'][0]['term'];
          lastStatus=LotteryStatus.sealingPlateStatus;
        }
      }
    }
    state.text_timer.value = roomcountdown['${key}Time'] ?? '';
    lastStatusContent = roomcountdown['${key}Time'] ?? '';
    ///处理咪牌开奖逻辑
    if(state.text_timer.value == Intr().fengpanzhong){
      fengpanCount++;
    }else {
      fengpanCount = -1;
    }
    update(["textTimerItem"]);
  }

  var fengpanCount = 0;

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
    fiveCountDownTime = second;
    update(["fiveCountDownStatus"]);
  }

  syschronizeStatus() {
    if (currentStatus.value != LotteryStatus.fiveCountDownStatus) {
      fiveCountDownTime = -1;
    }
    update(["fiveCountDownStatus"]);
  }

  showStartBet(String currentStatus,String term) {
     if (lastStatusContent == "0:00:00" &&
        currentStatus== Intr().fengpanzhong &&
        alreadyShowStop == false) {
      showCloseOver(term);
      alreadyShowStop = true;
      showStopBetting = true;
      update((["showStopBetting"]));
      Future.delayed(const Duration(seconds: 2,), () {
        showStopBetting = false;
        update((["showStopBetting"]));
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
    if ((showT == 30 || showT == 15 || showT == 10) &&
        (lastShowTime != showT)) {
      countDownLotteryEntity.value.type = "countTime";
      countDownLotteryEntity.value.status = LotteryStatus.countDownStatus.name;
      countDownLotteryEntity.value.time = showT;
      countDownLotteryEntity.value.term = term;
      countDownLotteryEntity.value.titleColor =0xFF58698D;
      countDownLotteryEntity.value.title = "xitongxiaoxi".tr;
      countDownLotteryEntity.value.subTitile = "${"julifengpan".tr}${showT}${"miao".tr}";
      countDownLotteryEntity.refresh();
    }
  }

  showOpen(int showT,String term) {
    if ((lastStatus != currentStatus.value)) {
      countDownLotteryEntity.value.type = "openOver";
      countDownLotteryEntity.value.title = "kaishixiazhu".tr;
      countDownLotteryEntity.value.titleColor=0xFF51AC57;
      countDownLotteryEntity.value.term = term;
      countDownLotteryEntity.value.subTitile = "kaishixiazhu".tr;
      countDownLotteryEntity.value.status = LotteryStatus.sealingPlateStatus.name;
      countDownLotteryEntity.refresh();
    }
  }
  showCloseOver(String term) {
      countDownLotteryEntity.value.type = "closeOver";
      countDownLotteryEntity.value.title = Intr().fengpanxinxi;
      countDownLotteryEntity.value.titleColor=0xFFFC243B;
      countDownLotteryEntity.value.term = term;
      countDownLotteryEntity.value.subTitile = Intr().kaishifengpan;
      countDownLotteryEntity.value.status = LotteryStatus.sealingPlateStatus.name;
      countDownLotteryEntity.refresh();
  }

  showStartBettingTime(int showT) {
    // print(
    //     "=====>firstShowStartBettingInPeriod  ${firstShowStartBettingInPeriod}  showT  ${showT}");
    if (firstShowStartBettingInPeriod && showT > 45) {
      firstShowStartBettingInPeriod = false;
      showStartBetting = true;
      update((["showStartBetting"]));
      Future.delayed(
          Duration(
            seconds: 2,
          ), () {
        showStartBetting = false;
        update((["showStartBetting"]));
      });
    }
  }
}
