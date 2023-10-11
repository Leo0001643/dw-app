import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

class SelectCurrencyState {
  SelectCurrencyState() {
    ///Initialize variables
  }


  var dropdownValue = LanguageMenuEntity(language: Intr().rmb, icon: ImageX.icon_jj_grey).obs;

  late List<LanguageMenuEntity> country = [
    dropdownValue.value,
    LanguageMenuEntity(language: Intr().dollar, icon: ImageX.icon_dollar_grey),
    LanguageMenuEntity(language: Intr().thb, icon: ImageX.icon_thb_grey),
    LanguageMenuEntity(language: Intr().vnd, icon: ImageX.icon_vhd_grey),
  ];

  late var coinList = country.obs;



}
