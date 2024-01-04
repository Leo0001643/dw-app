import 'dart:async';

import 'package:get/get.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/main/home/text_timer/text_timer_state.dart';

import '../../../bean/game_kind_entity.dart';
import '../../../bean/pc28_plan_entity.dart';

/**
 * 参考count_down_text.dart
 */
class TextTimerLogic {
  final TextTimerState state = TextTimerState();
  StreamSubscription? loginStream;
  var count = 100;
  String? type;
  Timer? countdownTimer;

  TextTimerLogic({required this.type});

  void onReady() {
    if (type.toString() == "jndx28") {
      count = 200;
    }
    if (type.toString() == "keno28") {
      count = 300;
    }
    if (type.toString() == "fastbtb28") {
      count = 400;
    }
  }

  void loadData(
      GameKindGameKindList gameKind, Pc28LottoEntity pc28lottoEntity) {
    //测试用
    onReady();
    HttpService.getPc28LottoList().then((value) {
      state.pc28Lotto.value = value;
      state.pc28Lotto.refresh();
      print(">>item.gameType>>>" + gameKind.gameCode.toString());
      /*   //测试用
      // Timer.periodic(Duration(seconds: 1), (timer) {
      //   count--;
      //   state.text_timer.value = count.toString();
      // });*/
      for (Pc28LottoRooms item in pc28lottoEntity.rooms!) {
        print(">>item.gameType" + item.gameType.toString());
        // 判断 gameCode 和 gameType 是否相等
        if (gameKind.gameCode == item.gameType) {
          // 执行倒计时逻辑
          state.text_timer.value = gameKind.gameCode.toString();
          loadTimerData(item);
        }
      }
    });
  }

  void loadTimerData(Pc28LottoRooms pc28lottoRoom) {
    //请求倒计时
    HttpService.getPC28Plan(5).then((value) {
      state.timerEntity.value = value;
      state.timerEntity.refresh();
      // 模拟异步获取的数据
      _calculateCountdown(pc28lottoRoom, state.timerEntity.value);
    });
  }

  void _calculateCountdown(
      Pc28LottoRooms pc28lottoRoom, Pc28PlanEntity pc28PlanEntity) {
    countdownTimer?.cancel();
    // 服务器的误差时间
    var diffTime =
        pc28PlanEntity.timestamp! - DateTime.now().millisecondsSinceEpoch;
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      /*  测试
   count--;
      state.text_timer.value = count.toString();*/
      timeCountOnly(diffTime, pc28lottoRoom, pc28PlanEntity);
      // 如果倒计时结束，取消计时器
      if (count <= 0) {
        countdownTimer?.cancel();
        // 你可能还想执行一些其他操作，或者重新启动倒计时
        // 例如，重新调用 _calculateCountdown 或执行其他逻辑
      }
    });
  }

  void timeCountOnly(
      diffTime, Pc28LottoRooms pc28lottoRoom, Pc28PlanEntity pc28planEntity) {
    Map<String, dynamic> allTime = pc28planEntity.all!.toJson();
    Map<String, dynamic> roomcountdown = {};
    Map<String, dynamic> roominf = pc28lottoRoom.toJson();

    for (String key in allTime.keys) {
      if (allTime[key]['data'].length > 1) {
        for (int s = 0; s < allTime[key]['data'].length - 1; s++) {
          int onlineT = DateTime.now().millisecondsSinceEpoch +
              int.parse(diffTime.toString());
          if (onlineT <= allTime[key]['data'][s + 1]['openTime']) {
            int openT =
                (int.parse(allTime[key]['data'][s + 1]['openTime'].toString()) -
                        onlineT) ~/
                    1000;
            roomcountdown[key + 'OpenResult'] = openT;
            if (openT == 0) {
              roomcountdown[key + 'OpenResult'] = '开奖中';
            }

            if (onlineT < allTime[key]['data'][s]['closeTime'] &&
                onlineT > allTime[key]['data'][s]['openTime']) {
              int rrtime = allTime[key]['data'][s]['closeTime'];
              int showT = (rrtime - onlineT) ~/ 1000;
              String showtime = secToTime(showT);
              roomcountdown[key + 'Time'] = showtime;
              roomcountdown[key + 'Term'] = allTime[key]['data'][s]['term'];
              break;
            } else if (onlineT > allTime[key]['data'][s]['closeTime'] &&
                onlineT < allTime[key]['data'][s + 1]['openTime']) {
              roomcountdown[key + 'Time'] = "封盘中";
              roomcountdown[key + 'Term'] = allTime[key]['data'][s]['term'];
              break;
            }
          }
        }
      } else if (allTime[key]['data'].length == 1) {
        int onlineT =
            DateTime.now().millisecondsSinceEpoch + int.parse(diffTime);
        if (onlineT < allTime[key]['data'][0]['closeTime'] &&
            onlineT > allTime[key]['data'][0]['openTime']) {
          int rrtime = allTime[key]['data'][0]['closeTime'];
          int showT = (rrtime - onlineT) ~/ 1000;
          String showtime = secToTime(showT);
          roomcountdown[key + 'Time'] = showtime;
          roomcountdown[key + 'Term'] = allTime[key]['data'][0]['term'];
        } else if (onlineT < allTime[key]['data'][0]['openTime']) {
          roomcountdown[key + 'Time'] = "封盘中";
          roomcountdown[key + 'Term'] = allTime[key]['data'][0]['term'];
        }
      }
      state.text_timer.value = roomcountdown[key + 'Time'];

    }
  }

  String secToTime(int sec) {
    int hours = sec ~/ 3600;
    int minutes = (sec % 3600) ~/ 60;
    int seconds = sec % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
