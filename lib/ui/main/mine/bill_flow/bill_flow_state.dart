import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

class BillFlowState {
  BillFlowState() {
    ///Initialize variables
  }

  var currentWallet = BillWalletEntity(Intr().wallet_cny, ImageX.icon_jj_grey,ImageX.icon_jj_red).obs;

  late List<BillWalletEntity> wallets = [
    currentWallet.value,
    BillWalletEntity(Intr().wallet_usdt, ImageX.icon_dollar_grey,ImageX.icon_dollar_red),
  ];

}
