import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';

import 'room_list_state.dart';

class RoomListLogic extends GetxController {
  final RoomListState state = RoomListState();

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


  void loadData(GameKindGameKindList kind) {
    loggerArray(["收到页面参数",kind.toString()]);
    HttpService.getPc28LottoList().then((value) {
      state.pc28Lotto.value = value;
      state.pc28Lotto.refresh();
      value.rooms?.forEach((element) {
        if(element.gameType == kind.gameCode){
          state.title.value = element.memo.em();
          state.room.value = element;
        }
      });
    });
  }


  void clickRate(Pc28LottoRoomsTables? room,String type){
    logger(room?.toString());
    //fastbtb28HighRate
    HttpService.getNewsRate("${room?.gameType.em()}$type").then((value) {
      Get.toNamed(Routes.html,arguments: HtmlEvent(isHtmlData: true,data: value.content.em(),pageTitle: value.name.em()));
    });
  }








}
