import 'dart:convert';

import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';

import 'room_tendency_state.dart';

class RoomTendencyLogic extends GetxController {
  final RoomTendencyState state = RoomTendencyState();

  @override
  void onReady() {
    loadData(Get.arguments);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData(Pc28LottoRoomsTables room) {
    state.room = room;
    print("=======>${room.gameType}");
    HttpService.getDewInfo({"countTerm":50,"gameType":room.gameType,"lotteryVersion":200}).then((value) {
      loggerArray(["走势数据",jsonEncode(value)]);
      Get.find<RoomTendencyController>().updateTendency(value);
    });

  }




}
