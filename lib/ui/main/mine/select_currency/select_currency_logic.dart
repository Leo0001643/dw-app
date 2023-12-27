import 'dart:convert';

import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/controller/wallet_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';

import 'select_currency_state.dart';

class SelectCurrencyLogic extends GetxController {
  final SelectCurrencyState state = SelectCurrencyState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    if(AppData.wallet()){
      state.dropdownValue = state.country.first.obs;
    } else {
      state.dropdownValue =state. country.last.obs;
    }
    update();
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
      print("=====>${jsonEncode(state.dropdownValue.value.toJson())}");
      if(item.language?.contains("USDT")==true) {
        showToast("已成功切换成USDT钱包\n 进入游戏将使用USDT");
      }else{
        showToast("已成功切换成CNY钱包\n 进入游戏将使用CNY");
      }

      ///更新选中数据
      state.dropdownValue.value = item;
      state.dropdownValue.refresh();
      AppData.setWallet(!AppData.wallet());

      print("存储  ${!AppData.wallet()}");
      ///切换钱包
      Get.find<WalletController>().changeWallet();
      var currency = AppData.wallet() ? "CNY":"USDT";
      showToast(Intr().yichenggongqiehuan_([currency,currency]));
      Get.back();
    }
  }


}
