import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/bean/pc28_plan_entity.dart';
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
  openLotteryStatus(10);

  final int num;

  const LotteryStatus(this.num);
}

/**
 * 参考count_down_text.dart
 */
class TextItemLogic extends GetxController {
  final TextTimerState state = TextTimerState();
  StreamSubscription? loginStream;
  var count = 100;
  String? type;
  String? status = "封盘中";
  String? lastStatus;
  bool alreadyShowStop = false;
  Timer? countdownTimer;

  int fiveCountDownTime = -1;
  bool showStopBetting = false;
  bool showStartBetting = false;
  bool firstShowStartBettingInPeriod = true;
  LotteryStatus currentStatus = LotteryStatus.initStatus;

  setType(String? type) {
    this.type = type;
  }

  TextItemLogic({this.type});

  void loadData(GameKindGameKindList gameKind) {
    //测试用
    HttpService.getPc28LottoList().then((value) {
      print("==========>getPc28LottoList  ${jsonEncode(value.toJson())}");
      print("==========>item.gameCode  ${gameKind.gameCode}");
      for (Pc28LottoRooms item in value.rooms!) {
        // 判断 gameCode 和 gameType 是否相等
        if (gameKind.gameCode == item.gameType) {
          // 执行倒计时逻辑
          loadTimerData(item);
        }
      }
    });
  }

  void loadDataGameCode(String gameCode) {
    //测试用
    HttpService.getPc28LottoList().then((value) {
      print("==========>getPc28LottoList2  ${jsonEncode(value.toJson())}");
      print("==========>item.gameCode2  ${gameCode}");
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
      print("==========>getPC28Plan  ${jsonEncode(value.toJson())}");

      _calculateCountdown(pc28lottoRoom, value);
    });
  }

  void _calculateCountdown(
      Pc28LottoRooms pc28lottoRoom, Pc28PlanEntity pc28PlanEntity) {
    countdownTimer?.cancel();
    print("==========>pc28lottoRoom  ${jsonEncode(pc28lottoRoom.toJson())}");
    // 服务器的误差时间
    var diffTime =
        pc28PlanEntity.timestamp! - DateTime.now().millisecondsSinceEpoch;
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      try {
        timeCountOnly(diffTime, pc28lottoRoom, pc28PlanEntity);
      } catch (e) {
        print("loadTimerData  倒计时  报错");
      }

      // 如果倒计时结束，取消计时器
      if (count <= 0) {
        countdownTimer?.cancel();
      }
    });
  }

  void timeCountOnly(
      diffTime, Pc28LottoRooms pc28lottoRoom, Pc28PlanEntity pc28planEntity) {
    Map<String, dynamic> allTime = pc28planEntity.all!.toJson();
    print("--------->diffTime  ${diffTime}");

    Map<String, dynamic> roomcountdown = {};
    Map<String, dynamic> roominf = pc28lottoRoom.toJson();
    String key = pc28lottoRoom.gameType.toString();
    print(
        "--------->key   ${key}  pc28lottoRoom.stateMsg  ${pc28lottoRoom.stateMsg}");
    print("--------->allTime   ${jsonEncode(allTime[key])}");
    if (pc28lottoRoom.stateMsg != "0") {
      if (pc28lottoRoom.stateMsg == 1) {
        roomcountdown[key + 'Time'] = Intr().weihuzhong;
      } else if (pc28lottoRoom.stateMsg == 3) {
        roomcountdown[key + 'Time'] = Intr().yiguanpan;
      } else if (pc28lottoRoom.stateMsg == 4) {
        roomcountdown[key + 'Time'] = Intr().yixiushi;
      }
      roomcountdown[key + 'Term'] = '--';
      roomcountdown[key + 'Notice'] = allTime[key]['msg'] ?? '';
    } else if (allTime[key]['code'] == 100020) {
      print("++++++++++++++++等待开盘");
      roomcountdown[key + 'Time'] = Intr().dengdaikaipan;
      roomcountdown[key + 'Term'] = '--';
      roomcountdown[key + 'Notice'] = allTime[key]['msg'];
    } else {
      resetStatusWhenStart();
      if (allTime[key]['data'] == null) {
        print("++++++++++++++++等待开盘2");
        state.text_timer.value = Intr().dengdaikaipan;
      }
      if (allTime[key]['data']?.length > 1) {
        for (int s = 0; s < allTime[key]['data'].length - 1; s++) {
          //差异时间
          int onlineT = DateTime.now().millisecondsSinceEpoch +
              int.parse(diffTime.toString());
          //开始时间
          if (onlineT <= allTime[key]['data'][s + 1]['openTime']) {
            int openT =
                (int.parse(allTime[key]['data'][s + 1]['openTime'].toString()) -
                        onlineT) ~/
                    1000;
            roomcountdown[key + 'OpenResult'] = openT;
            if (openT == 0) {
              roomcountdown[key + 'OpenResult'] = '开奖中';
            }
            //现在时间  小于关闭时间，大于开始时间， 则显示倒计时
            if (onlineT < allTime[key]['data'][s]['closeTime'] &&
                onlineT > allTime[key]['data'][s]['openTime']) {
              print("显示倒计时");
              showStartBettingTime();
              int rrtime = allTime[key]['data'][s]['closeTime'];
              int showT = (rrtime - onlineT) ~/ 1000;
              String showtime = secToTime(showT);
              roomcountdown[key + 'Time'] = showtime;
              roomcountdown[key + 'Term'] = allTime[key]['data'][s]['term'];
              if (showT <= 5) {
                showOverTime(showT);
              }

              break;
            } else if (onlineT > allTime[key]['data'][s]['closeTime'] &&
                onlineT < allTime[key]['data'][s + 1]['openTime']) {
              //现在时间  大于关闭时间，小于下一期开奖时间， 则显示封盘中
              print("封盘中");
              resetStatusWhenClosed();

              roomcountdown[key + 'Time'] = "封盘中";
              roomcountdown[key + 'Term'] = allTime[key]['data'][s]['term'];
              showStartBet(roomcountdown[key + 'Time']);
              break;
            }
          }
        }
      } else if (allTime[key]['data'].length == 1) {
        //倒计时长度为1 的情况
        print("==========倒计时长度为1");
        int onlineT = DateTime.now().millisecondsSinceEpoch +
            int.parse(diffTime.toString());
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
          roomcountdown[key + 'Time'] = showtime;
          roomcountdown[key + 'Term'] = allTime[key]['data'][0]['term'];
        } else if (onlineT < allTime[key]['data'][0]['openTime']) {
          resetStatusWhenClosed();

          //现在时间 opentime直接显示封盘中
          print("为1  封盘中");
          roomcountdown[key + 'Time'] = "封盘中";
          roomcountdown[key + 'Term'] = allTime[key]['data'][0]['term'];
        }
      }
    }
    state.text_timer.value = roomcountdown[key + 'Time'];
    lastStatus = roomcountdown[key + 'Time'];
    update(["textTimerItem"]);
  }

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
    print("result ${result}");
    return result;
  }

  //倒计时5s
  showOverTime(int second) {
    fiveCountDownTime = second;
    update(["fiveCountDownStatus"]);
  }

  syschronizeStatus() {
    if (currentStatus != LotteryStatus.fiveCountDownStatus) {
      fiveCountDownTime = -1;
    }
    update(["fiveCountDownStatus"]);
  }

  showStartBet(String currentStatus) {
    print("=========>lastStatus ${lastStatus}  status ${currentStatus}");
    if (lastStatus == "0:00:00" &&
        currentStatus == "封盘中" &&
        alreadyShowStop == false) {
      alreadyShowStop = true;
      showStopBetting = true;
      update((["showStopBetting"]));
      Future.delayed(
          Duration(
            seconds: 2,
          ), () {
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

  showStartBettingTime() {
    print("=====>firstShowStartBettingInPeriod  ${firstShowStartBettingInPeriod}");

    if (firstShowStartBettingInPeriod) {
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
