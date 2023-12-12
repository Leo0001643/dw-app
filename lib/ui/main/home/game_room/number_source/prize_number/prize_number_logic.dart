import 'package:get/get.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';

import 'prize_number_state.dart';

class PrizeNumberLogic extends GetxController {
  final PrizeNumberState state = PrizeNumberState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() {

    HttpService.getBtcSource({"gameType":Get.find<GameRoomLogic>().state.room.value.gameType}).then((value) {
      state.data.assignAll(value);
      state.data.refresh();
    });
  }





}
