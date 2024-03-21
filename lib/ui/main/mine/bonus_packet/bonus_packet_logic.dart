import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/ui/bean/prize_list_entity.dart';

import 'bonus_packet_state.dart';

class BonusPacketLogic extends GetxController {
  final BonusPacketState state = BonusPacketState();

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadData() {
    var user = AppData.user();

    HttpService.getPrize({"oid":user?.oid,"username":user?.username}).then((value) {
      state.detail = value;
      changeTab();
    });
  }

  void changeTab(){
    state.wallets.forEach((element) {
      if(state.currentWallet.value == element){
        var index = state.wallets.indexOf(element);
        if(index == 0){
          state.record.assignAll(state.detail.redPackets ?? []);
        }else {
          state.record.assignAll(state.detail.prizes ?? []);
        }
        state.record.refresh();
      }
    });
  }

  void prizeOut(PrizeListPrizes item){
    var user = AppData.user();
    HttpService.getPrizesOut({"oid":user?.oid,"username":user?.username,"id":item.id}).then((value) {
      ///操作成功需要刷新数据
      loadData();
    });
  }







}
