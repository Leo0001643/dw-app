import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

import 'select_language_state.dart';

class SelectLanguageLogic extends GetxController {
  final SelectLanguageState state = SelectLanguageState();

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

  void searchCountry(String value){

    if(unEmpty(value)){
      var list = List<LanguageMenuEntity>.empty(growable: true);
      state.country.forEach((element) {
        if(element.language.em().contains(value)){
          list.add(element);
        }
      });
      state.countryList.value = list;
    } else {
      state.countryList.value = state.country;
    }


  }





}
