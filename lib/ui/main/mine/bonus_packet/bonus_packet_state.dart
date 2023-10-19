import 'package:get/get.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';

class BonusPacketState {
  BonusPacketState() {
    ///Initialize variables
  }



  var currentWallet = BillWalletEntity("红包", ImageX.icon_pkg_grey,ImageX.icon_pkg_red).obs;

  late List<BillWalletEntity> wallets = [
    currentWallet.value,
    BillWalletEntity("奖金", ImageX.icon_jj_grey,ImageX.icon_jj_red),
  ];


  var record = ["","","","","","","","","","",""].obs;



}
