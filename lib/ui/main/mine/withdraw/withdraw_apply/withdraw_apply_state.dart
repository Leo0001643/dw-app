import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

class WithdrawApplyState {
  WithdrawApplyState() {
    ///Initialize variables
  }


  var dropdownValue = LanguageMenuEntity(language: Intr().qingxuanzhetixianzhanghu).obs;

  late List<LanguageMenuEntity> country = [
    dropdownValue.value,
    LanguageMenuEntity(language: Intr().rmb,),
    LanguageMenuEntity(language: Intr().dollar,),
    LanguageMenuEntity(language: Intr().thb,),
    LanguageMenuEntity(language: Intr().vnd,),
  ];

  var pwdVisible = false.obs;
  var pwdValue = "";

}
