import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/chess_event.dart';
import 'package:leisure_games/ui/bean/ds_game_entity.dart';
import 'package:leisure_games/ui/bean/ele_game_type_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';

import 'table_game_list_state.dart';

class TableGameListLogic extends GetxController {
  final TableGameListState state = TableGameListState();

  @override
  void onReady() {
    ChessEvent event = Get.arguments;
    state.kindList = event.chessKind.gameKindList;
    state.current = event.child;
    state.title.value = event.child.gameName.em();
    loadGameType(state.current!);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void loadGameType(GameKindGameKindList kind){
    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    var params = <String,dynamic>{
      "oid":user?.oid,"username":user?.username,"pt":kind.liveId,"cur":cur
    };
    HttpService.getGameTypeList(params).then((value) {
      // state.tabIndex = 0;///初始化第一个tab位置下标
      value.insert(0, EleGameTypeEntity(gametype: Intr().quanbuyouxi));
      value.add(EleGameTypeEntity(gametype: Intr().wodeshoucang));
      state.tabLength.value = value.length;
      state.typeList.assignAll(value);
      state.typeList.refresh();
      loadData(kind);
    });
  }

  void loadData(GameKindGameKindList kind) {

    var user = AppData.user();
    var cur = AppData.wallet() ? 1: 5;
    var params = <String,dynamic>{
      "oid":user?.oid,"username":user?.username,"pt":kind.liveId,"cur":cur,"page":1,"pageSize":500,
    };
    HttpService.getDsgame(params).then((value) {
      state.allList = value;
      clickTab(0);
    });
  }

  ///筛选功能
  void loadByKeyword(String keyword,int tabIndex){
    if(unEmpty(keyword)){
      state.list.clear();
      state.allList.games?.forEach((key, value) {
        value?.forEach((element) {
          if(element.gamename.em().contains(keyword) == true){
            state.list.add(element);
          }
        });
      });
      state.list.refresh();
    }else {
      clickTab(tabIndex);
    }
  }

  void clickTab(int index) {
    // state.tabIndex = index;
    var gametype = state.typeList[index].gametype.em();
    if(gametype == Intr().quanbuyouxi){
      state.list.clear();
      state.allList.games?.forEach((key, value) {
        state.list.addAll(value ?? []);
      });
    } else if(gametype == Intr().wodeshoucang){
      state.list.clear();
      state.allList.games?.forEach((key, value) {
        value?.forEach((element) {
          if(element.favStatus == 1){
            state.list.add(element);
          }
        });
      });
    }else {
      state.list.assignAll(state.allList.games![gametype] ?? []);
    }
    var n = state.list.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (state.list[j].orderby.em() < state.list[j + 1].orderby.em()) {
          // 交换 arr[j] 和 arr[j+1]
          var temp = state.list[j];
          state.list[j] = state.list[j + 1];
          state.list[j + 1] = temp;
        }
      }
    }
    state.list.refresh();

  }

  ///收藏
  void gameFav(DsGameGamesZm item,int tabIndex){
    var user = AppData.user();

    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username,"gameId":item.id};
    HttpService.gameFav(params).then((value) {
      item.favStatus = item.favStatus==1 ? 2:1;
      state.allList.games?.forEach((key, value) {
        if(value?.contains(item) == true){
          value![value.indexOf(item)] = item;
        }
      });
      clickTab(tabIndex);
      showToast(value);
    });
  }


  ///打开游戏页面
  void openGamePage(DsGameGamesZm element) {
    var cur = AppData.wallet() ? 1: 5;

    var user = AppData.user();

    //"gameType":gameType,
    var params = <String,dynamic>{ "cur":cur, "tags":element.tag,
      "platform":element.platformName,"gameCode":element.gameidstr,"gameType":element.gameidstr,"pageSite":"game",
      "oid":user?.oid,"username":user?.username,"platformURL": Constants.frontDomain()};

    WidgetUtils().loginJump(element.gamename.em(),params);
  }




}
