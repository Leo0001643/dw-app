import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/controller/wallet_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

import 'select_currency_state.dart';

class SelectCurrencyLogic extends GetxController {
  final SelectCurrencyState state = SelectCurrencyState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  void searchCoin(String value){

    if(unEmpty(value)){
      var list = List<BalanceEntity>.empty(growable: true);
      state.country.forEach((element) {
        if(element.language.em().contains(value)){
          list.add(element);
        }
      });
      state.coinList.value = list;
    } else {
      state.coinList.value = state.country;
    }


  }

  void changeWallet(BalanceEntity item) {
    if(item != state.dropdownValue.value){
      ///更新选中数据
      state.dropdownValue.value = item;
      state.dropdownValue.refresh();
      AppData.setWallet(!AppData.wallet());
      ///切换钱包
      Get.find<WalletController>().changeWallet();
      Get.back();
    }
  }


}
