import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';

class WithdrawState {
  WithdrawState() {
    ///Initialize variables
  }

  ///提现信息，银行卡和数字钱包
  var userDraw = UserDrawDetailEntity().obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();

}
