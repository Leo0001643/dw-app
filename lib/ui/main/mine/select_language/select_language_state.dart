import 'package:get/get.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

class SelectLanguageState {
  SelectLanguageState() {
    ///Initialize variables
  }

  var dropdownValue = LanguageMenuEntity(language: "中文简体", icon: ImageX.icon_zh).obs;

  late List<LanguageMenuEntity> country = [
    dropdownValue.value,
    LanguageMenuEntity(language: "English", icon: ImageX.icon_us),
    LanguageMenuEntity(language: "Deutsch", icon: ImageX.icon_de),
    LanguageMenuEntity(language: "Indonesia", icon: ImageX.icon_indonesia),
  ];

  late var countryList = country.obs;



}
