import 'package:get/get.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';

class BettingRecordState {
  BettingRecordState() {
    ///Initialize variables
  }

  var currentWallet = BillWalletEntity("CNY钱包", ImageX.icon_jj_grey,ImageX.icon_jj_red).obs;

  late List<BillWalletEntity> wallets = [
    currentWallet.value,
    BillWalletEntity("USDT钱包", ImageX.icon_dollar_grey,ImageX.icon_dollar_red),
  ];

  var record = ["","","","","","","","","",""].obs;


}
