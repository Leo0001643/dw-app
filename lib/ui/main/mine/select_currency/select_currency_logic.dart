import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
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
      var list = List<LanguageMenuEntity>.empty(growable: true);
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


}
