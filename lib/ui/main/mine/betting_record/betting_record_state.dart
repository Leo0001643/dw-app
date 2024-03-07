import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/bet_record_group_entity.dart';
import 'package:leisure_games/ui/bean/bill_wallet_entity.dart';

class BettingRecordState {
  BettingRecordState() {
    ///Initialize variables
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var currentWallet = BillWalletEntity(Intr().wallet_cny, ImageX.icon_jj_grey,ImageX.icon_jj_red).obs;

  late List<BillWalletEntity> wallets = [
    currentWallet.value,
    BillWalletEntity(Intr().wallet_usdt, ImageX.usdt,ImageX.active_usdt),
  ];

  ///投注记录
  var record = BetRecordGroupEntity().obs;


}
