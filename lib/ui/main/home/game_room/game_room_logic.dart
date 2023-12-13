import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';

import 'game_room_state.dart';

class GameRoomLogic extends GetxController {
  final GameRoomState state = GameRoomState();

  @override
  void onReady() {
    loadBalance();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  void onTabClick(BuildContext context,int index){
    switch(index){
      case 0:
        Get.toNamed(Routes.number_source);
        break;
      case 1:
        if(AppData.isLogin()){
          Get.toNamed(Routes.betting_details);
        } else {
          showToast(Intr().qingxiandenglu);
        }
        break;
      case 2:
        DialogUtils().showSqueezeBtmDialog(context,this);
        break;
      case 3:
        Get.toNamed(Routes.room_tendency);
        break;
    }
  }

  void loadData(Pc28LottoRoomsTables room) {
    loggerArray(["房型数据",state.room.toJson()]);
    state.roomType.value = room.level ?? 1;

    HttpService.getPc28LottoList().then((value) {
      state.pc28Lotto.value = value;
      state.pc28Lotto.refresh();
      changeRoomType(room);
    });

    HttpService.getPC28Odds(room.id.em()).then((value) {
      // loggerArray(["输出格式化数据处理",jsonEncode(value),]);
      Map<String,dynamic> map = jsonDecode(value,);

    });

    ///表情
    HttpService.getExpression().then((value) {
      state.expressions.assignAll(value);
    });

    ///文字
    HttpService.getPhrase().then((value) {
      state.phrases.assignAll(value);
    });
    
  }

  void changeRoomType(Pc28LottoRoomsTables room) {
    state.pc28Lotto.value.rooms?.forEach((element) {
      if(element.gameType == room.gameType){
        state.title.value = element.memo.em();
        state.room.value = room;
        state.roomType.value = room.level ?? 1;
        state.room.refresh();
      }
    });
  }

  void loadBalance() {

    var user = AppData.user();
    HttpService.getBalance({ "cur":1, "platform":"main","oid":user?.oid,"username":user?.username }).then((value) {
      state.userBal.value = value;
      state.userBal.refresh();
    });

  }

  //

}
