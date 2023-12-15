import 'package:get/get.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/room_tendency_logic.dart';

import 'lottery_result_state.dart';

class LotteryResultLogic extends GetxController {
  final LotteryResultState state = LotteryResultState();

  @override
  void onReady() {
    // loadData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData() {
    //游戏代码【xy28:北京28,fastbtb28:比特币1分28,keno28:加拿大28,jndx28:加拿大西28,tw28:台湾宾果28,elg28:美国俄勒冈28,slfk28:斯洛伐克28】
    //1:最近10期开奖结果,2:最近10期开奖结果,包含最近未开奖1期
    HttpService.getDrawLotteryData({"gameCode":Get.find<RoomTendencyLogic>().state.room?.gameType,
      "method":1,}).then((value) {
        state.list.assignAll(value);
        state.list.refresh();
    });


  }


}
