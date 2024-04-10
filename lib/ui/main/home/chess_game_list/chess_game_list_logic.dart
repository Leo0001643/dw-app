import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/chess_event.dart';
import 'package:leisure_games/ui/bean/chess_info_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';

import 'chess_game_list_state.dart';

class ChessGameListLogic extends GetxController {
  final ChessGameListState state = ChessGameListState();

  @override
  void onReady() {
    ChessEvent event = Get.arguments;
    state.kindList = event.chessKind.gameKindList;
    state.current = event.child;
    state.title.value = event.child.gameName.em();
    loadData(state.current!);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadData(GameKindGameKindList kind) {

    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    var params = <String,dynamic>{
      "oid":user?.oid,"username":user?.username,"pt":kind.liveId,"cur":cur,
    };
    HttpService.getChessList(params).then((value) {
      state.allList.assignAll(value);
      state.list.assignAll(value);
      state.list.refresh();
    });
  }

  ///筛选功能
  void loadByKeyword(String keyword){
    state.list.clear();
    if(unEmpty(keyword)){
      state.allList.forEach((element) {
        if(element.gamename.em().contains(keyword)){
          state.list.add(element);
        }
      });
    }else {
      state.list.addAll(state.allList);
    }
    state.list.refresh();
  }


  ///打开游戏页面
  void openGamePage(ChessInfoEntity element) {
    var cur = AppData.wallet() ? 1: 5;

    var user = AppData.user();

    //"gameType":gameType,
    var params = <String,dynamic>{ "cur":cur, "tags":element.tag,
      "platform":element.platformName,"gameCode":element.gameidstr,
      "pageSite":"game",
      "oid":user?.oid,"username":user?.username,"platformURL": Constants.frontDomain()};
    WidgetUtils().loginJump(element.gamename.em(),params);
  }




}
