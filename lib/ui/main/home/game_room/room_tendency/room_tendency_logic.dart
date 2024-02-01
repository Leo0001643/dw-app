import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';

import 'room_tendency_state.dart';

class RoomTendencyLogic extends GetxController {
  final RoomTendencyState state = RoomTendencyState();
  Timer? countdownTimer;

  @override
  void onReady() {
    loadData(Get.arguments);
    Future.delayed(Duration(seconds: 5), () {
      startTimer();
    });
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    countdownTimer?.cancel();
    countdownTimer = null;
  }

  void loadData(Pc28LottoRoomsTables room,{bool loading=true}) {
    state.room = room;
    print("=======>${room.gameType}");
    HttpService.getDewInfo(
            {"countTerm": 50, "gameType": room.gameType, "lotteryVersion": 200},loading: loading)
        .then((value) {
      loggerArray(["走势数据", jsonEncode(value)]);
      Get.find<RoomTendencyController>().updateTendency(value);
    });
  }

  startTimer() {
    countdownTimer?.cancel();
    countdownTimer = Timer.periodic(Duration(seconds: 45), (timer) {
      try {
        loadData(state.room ?? Pc28LottoRoomsTables(),loading: false);
      } catch (e) {
        print("loadTimerData  倒计时  报错${e.toString()}");
      }
      // 如果倒计时结束，取消计时器
    });
  }
}
