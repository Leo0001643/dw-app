import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/network/http_service.dart';

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
    // TODO: implement onClose
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





}
