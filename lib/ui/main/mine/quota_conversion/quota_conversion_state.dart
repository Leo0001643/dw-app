import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/platform_entity.dart';

class QuotaConversionState {
  QuotaConversionState() {
    ///Initialize variables
  }

  var leftAccount = PlatformEntity().obs;
  var rightAccount = PlatformEntity().obs;

  ///平台列表
  var platforms = RxList<PlatformEntity>.empty(growable: true);

  ///输入的金额
  var inputAmount = "".obs;

  ///主账户余额
  var mainBal = BalanceEntity().obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();


}
