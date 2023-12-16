import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/main/home/home_logic.dart';

class SelectCurrencyState {
  SelectCurrencyState() {
    ///Initialize variables
    if(AppData.wallet()){
      dropdownValue = country.first.obs;
    } else {
      dropdownValue = country.last.obs;
    }
    var homeState = Get.find<HomeLogic>().state;
    country[0].money = homeState.cnyBal.value.money;
    country[1].money = homeState.usdtBal.value.money;

  }

  late Rx<BalanceEntity> dropdownValue;
  late var coinList = country.obs;

  List<BalanceEntity> country = [
    BalanceEntity(language: "${Intr().wallet_cny}（CNY）¥", icon: ImageX.icon_rmb_grey),
    BalanceEntity(language: "${Intr().wallet_usdt}（USDT）₮", icon: ImageX.icon_ustd2_grey),
    // LanguageMenuEntity(language: Intr().thb, icon: ImageX.icon_thb_grey),
    // LanguageMenuEntity(language: Intr().vnd, icon: ImageX.icon_vhd_grey),
  ];




}
