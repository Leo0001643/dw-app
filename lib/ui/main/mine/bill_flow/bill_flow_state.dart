import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/refresh_change_notifier.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';
import 'package:leisure_games/ui/bean/flow_data_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BillFlowState {
  BillFlowState() {
    ///Initialize variables
  }

  var currentWallet = BillWalletEntity(Intr().wallet_cny, ImageX.iconJjGrey(),ImageX.icon_jj_red).obs;

  late List<BillWalletEntity> wallets = [
    currentWallet.value,
    BillWalletEntity(Intr().wallet_usdt, ImageX.usdtT(),ImageX.active_usdt),
  ];

  var filterTime = [
    PaymentListBanks(bankName: Intr().jintian,id: 0),
    PaymentListBanks(bankName: Intr().day_7,id: 1),
    PaymentListBanks(bankName: Intr().day_15,id: 2),
  ];

  var filterStatus = [
    PaymentListBanks(bankName: Intr().quanbujilu,id: 0),
    PaymentListBanks(bankName: Intr().cunqukuan,id: 1),
    PaymentListBanks(bankName: Intr().zhuanzhang,id: 2),
  ];

  ///选择的时间
  var selectTime = PaymentListBanks(bankName: Intr().jintian,id: 0).obs;

  ///选择的状态
  var selectStatus = PaymentListBanks(bankName: Intr().quanbujilu,id: 0).obs;
  ///选择的tab下标
  var selectIndex = 0;
  ///页数
  var page = 1;
  late RefreshController refreshController;
  var refreshListener = RefreshChangeNotifier();
  var scaffoldKey = GlobalKey<ScaffoldState>();


  var list = RxList<FlowDataList>.empty(growable: true);

}
