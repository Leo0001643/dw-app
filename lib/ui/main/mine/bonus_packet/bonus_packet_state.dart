import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';
import 'package:leisure_games/ui/bean/prize_list_entity.dart';

class BonusPacketState {
  BonusPacketState() {
    ///Initialize variables
  }



  var currentWallet = BillWalletEntity(Intr().hongbao, ImageX.icon_pkg_grey,ImageX.icon_pkg_red).obs;

  late List<BillWalletEntity> wallets = [
    currentWallet.value,
    BillWalletEntity(Intr().jiangjin, ImageX.icon_jj_grey,ImageX.icon_jj_red),
  ];


  ///记录
  var record = RxList<PrizeListPrizes>.empty(growable: true);

  ///详情
  var detail = PrizeListEntity();


}
