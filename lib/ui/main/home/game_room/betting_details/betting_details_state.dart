import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/refresh_change_notifier.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';
import 'package:leisure_games/ui/bean/current_bet_entity.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BettingDetailsState {
  BettingDetailsState() {
    ///Initialize variables
  }

  var currentWallet = BillWalletEntity(Intr().wallet_cny, ImageX.icon_jj_grey,ImageX.icon_jj_red).obs;

  late List<BillWalletEntity> wallets = [
    currentWallet.value,
    BillWalletEntity(Intr().wallet_usdt, ImageX.usdt,ImageX.active_usdt),
  ];


  var page = 1;

  var bettingDetails = CurrentBetEntity().obs;
  var list = RxList<CurrentBetContent>.empty(growable: true);

  late RefreshController refreshController;
  var refreshListener = RefreshChangeNotifier();

  ///房型
  var types = List<Pc28LottoRooms>.empty(growable: true);
  ///选择的房型
  var type = Pc28LottoRooms(memo: Intr().quanbujilu).obs;

}
