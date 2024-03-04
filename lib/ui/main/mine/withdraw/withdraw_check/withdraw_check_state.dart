import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/withdraw_check_entity.dart';

class WithdrawCheckState {
  WithdrawCheckState() {
    ///Initialize variables
  }

  ///稽核信息
   var withdrawCheck = WithdrawCheckEntity().obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();


}
