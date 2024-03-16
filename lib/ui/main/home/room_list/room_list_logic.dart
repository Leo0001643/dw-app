import 'dart:convert';

import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
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
    // var isolateInitializer=IsolateInitializer();
    // isolateInitializer.init();
    // GameIsolate.instance.startGameIsolate();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void loadData(GameKindGameKindList? kind) {
    loggerArray(["收到页面参数",kind.toString()]);
    HttpService.getPc28LottoList().then((value) {
      value.rooms?.forEach((e1) {
        e1.tables?.forEach((e2) {
          e2.title = e1.memo.em();
        });
      });
      state.pc28Lotto.value = value;
      state.pc28Lotto.refresh();
      ///可能没有传数据，默认使用第一条
      if(isEmpty(kind)){
        state.room.value = value.rooms?.first ?? Pc28LottoRooms();
        state.title.value = state.room.value.memo.em();
      }else {
        value.rooms?.forEach((element) {
          if(element.gameType == kind?.gameCode){
            state.title.value = element.memo.em();
            state.room.value = element;
          }
        });
      }
    });
  }


  void clickRate(Pc28LottoRoomsTables? room,String type){
    logger(room?.toString());
    //fastbtb28HighRate
    HttpService.getNewsRate("${room?.gameType.em()}$type").then((value) {
      Get.toNamed(Routes.loss_percent,arguments: value);
    });
  }


  void clickRoom(Pc28LottoRoomsTables? room){
    if(unEmpty(room?.name)){
      print("跳转传入${jsonEncode(room?.toJson())}");
      Get.toNamed(Routes.game_room,arguments: room);
    }
  }





}
