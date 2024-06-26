import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';
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
    super.onClose();
  }

  void loadData(Pc28LottoRoomsTables room,{bool loading=true}) {
    state.room = room;
    HttpService.getDewInfo({"countTerm": 50, "gameType": room.gameType, "lotteryVersion": 200},loading: loading).then((value) {
      // loggerArray(["走势数据", jsonEncode(value)]);
      Get.find<RoomTendencyController>().updateTendency(value);
    });
  }

}
