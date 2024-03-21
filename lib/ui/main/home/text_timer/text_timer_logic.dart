import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';


/// 参考count_down_text.dart
class TextTimerLogic {
  // StreamSubscription? loginStream;
  // var count = 100;
  String? type;
  Timer? countdownTimer;
  var text_timer = "".obs; //倒计时显示

  TextTimerLogic({required this.type});

  void stop(){
    countdownTimer?.cancel();
  }

  void loadData(GameKindGameKindList gameKind) {
    //测试用
    HttpService.getPc28LottoList().then((value) {
      for (Pc28LottoRooms item in value.rooms!) {
        // 判断 gameCode 和 gameType 是否相等
        if (gameKind.gameCode == item.gameType) {
          // 执行倒计时逻辑
          loadTimerData(item);
          break;
        }
      }
    });
  }


  void loadDataGameCode(String gameCode) {
    //测试用
    HttpService.getPc28LottoList().then((value) {
      for (Pc28LottoRooms item in value.rooms!) {
        // 判断 gameCode 和 gameType 是否相等
        if (gameCode == item.gameType) {
          // 执行倒计时逻辑
          loadTimerData(item,gameCode:gameCode);
          break;
        }
      }
    });
  }


  void loadTimerData(Pc28LottoRooms pc28lottoRoom,{String? gameCode}) {
    //请求倒计时
    HttpService.getPC28Plan(5).then((value) {
      _calculateCountdown(pc28lottoRoom, jsonDecode(value),gameCode:gameCode);
    });
  }

  void _calculateCountdown(
      Pc28LottoRooms pc28lottoRoom, Map<String,dynamic> pc28Plan,{String? gameCode}) {
    countdownTimer?.cancel();
    // 服务器的误差时间
    var diffTime = pc28Plan['timestamp'] - DateTime.now().millisecondsSinceEpoch;
    ///会有一秒的延迟 所以先调一次
    timeCountOnly(diffTime, pc28lottoRoom, pc28Plan);
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      timeCountOnly(diffTime, pc28lottoRoom, pc28Plan);
      // 如果倒计时结束，取消计时器
      // if (count <= 0) {
      //   countdownTimer?.cancel();
      // }
    });
  }

  void timeCountOnly(int diffTime, Pc28LottoRooms pc28lottoRoom, Map<String,dynamic> pc28Plan) {
    Map<String, dynamic> allTime = pc28Plan['all'];
    Map<String, dynamic> roomcountdown = {};

    // Map<String, dynamic> roominf = pc28lottoRoom.toJson();
    String key = pc28lottoRoom.gameType.em();
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
    } else if (allTime[key]['code'] == 100020) {
      roomcountdown['${key}Time'] = Intr().dengdaikaipan;
      roomcountdown['${key}Term'] = '--';
      roomcountdown['${key}Notice'] = allTime[key]['msg'];
    } else {
      var data = allTime[key]['data'] ?? [];
      ///如果已截止显示等待开奖
      if(isEmpty(data)) {
        roomcountdown['${key}Time'] = Intr().dengdaikaipan;
      }else if (data.length > 1) {
        for (int s = 0; s < data.length - 1; s++) {
          int onlineT = DateTime.now().millisecondsSinceEpoch + diffTime;
          if (onlineT <= data[s + 1]['openTime']) {
            int openT = (data[s + 1]['openTime'] - onlineT) ~/ 1000;
            roomcountdown['${key}OpenResult'] = openT;
            if (openT == 0) {
              roomcountdown['${key}OpenResult'] = Intr().kaijiangzhong;
            }
            if (onlineT < data[s]['closeTime'] && onlineT > data[s]['openTime']) {
              int rrtime = data[s]['closeTime'];
              int showT = (rrtime - onlineT) ~/ 1000;
              String showtime = secToTime(showT);
              roomcountdown['${key}Time'] = showtime;
              roomcountdown['${key}Term'] = data[s]['term'];
              break;
            } else if (onlineT > data[s]['closeTime'] && onlineT < data[s + 1]['openTime']) {
              roomcountdown['${key}Time'] = Intr().fengpanzhong;
              roomcountdown['${key}Term'] = data[s]['term'];
              break;
            }
          }
        }
      } else if (data.length == 1) {
        int onlineT = DateTime.now().millisecondsSinceEpoch + diffTime;
        var data = allTime[key]['data'] ?? [];

        if (onlineT <data[0]['closeTime'] && onlineT > data[0]['openTime']) {
          int rrtime = data[0]['closeTime'];
          int showT = (rrtime - onlineT) ~/ 1000;
          String showtime = secToTime(showT);
          roomcountdown['${key}Time'] = showtime;
          roomcountdown['${key}Term'] = data[0]['term'];
        } else if (onlineT < data[0]['openTime']) {
          roomcountdown['${key}Time'] = Intr().fengpanzhong;
          roomcountdown['${key}Term'] = data[0]['term'];
        }
      }
    }

    // loggerArray(['整理出来的TImer结果',roomcountdown,key]);

    text_timer.value = roomcountdown['${key}Time'] ?? "";
  }

  String secToTime(int sec) {
    int hours = sec ~/ 3600;
    int minutes = (sec % 3600) ~/ 60;
    int seconds = sec % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String subToTime(String sec) {
    if(sec.length<3) {
      return sec;
    }
    String result= sec.substring(2,sec.length);
    print("result ${result}");
    return result;
  }





}
