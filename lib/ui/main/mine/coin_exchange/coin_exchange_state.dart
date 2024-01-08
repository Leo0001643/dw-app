import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';

class CoinExchangeState {
  CoinExchangeState() {
    ///Initialize variables
  }

  final GlobalKey<ScaffoldState> scaffoldMineKey = GlobalKey<ScaffoldState>();

  ///余额
  var usdtBal = BalanceEntity().obs;
  var cnyBal = BalanceEntity().obs;

  ///兑换模式
  var c2u = true.obs;

  ///兑换金额
  var fromAmount = "".obs;
  var tout = 1.obs;
  var toAmount = "".obs;

  var usdtRate = 0.0.obs;

  var cnyRate = 0.0.obs;
}
