import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/utils/refresh_change_notifier.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';

import 'betting_details_state.dart';

class BettingDetailsLogic extends GetxController {
  final BettingDetailsState state = BettingDetailsState();

  @override
  void onReady() {
    loadTypes();
    loadData(true);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadData(bool refresh) {
    if(refresh){ state.page = 1; }

    var user = AppData.user();
    var params = <String,dynamic>{"oid":user?.oid,"username":user?.username,};
    params["page"] = state.page;
    params["pageLimit"] = Constants.pageSize;
    if(unEmpty(state.type.value.gameType)){
      params["gameType"] = state.type.value.gameType;
    }

    HttpService.getGameCurrentBet(params).then((value) {
      state.cnyList.clear();
      state.usdtList.clear();
      value.content?.forEach((element) {
        if(element.moneyType == 'CNY'){
          state.cnyList.add(element);
        }else {
          state.usdtList.add(element);
        }
      });
      state.page ++;
      RefreshChangeNotifier.loadData(refresh, state.refreshListener, state.list, state.cnyList);
    }).catchError((e,stack){
      RefreshChangeNotifier.loadData(refresh, state.refreshListener, state.list, null);
    });

  }

  void loadTypes() {
    HttpService.getPc28LottoList().then((value) {
      state.type.value = Pc28LottoRooms(memo: Intr().quanbujilu);
      state.type.refresh();
      state.types.assignAll(value.rooms ?? []);
      state.types.insert(0, state.type.value);
    });

  }




}
