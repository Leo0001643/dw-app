import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';

class BindBankState {
  BindBankState() {
    ///Initialize variables
  }

  ///最大绑卡数量
  var maxCount = 3;

  ///提现账户
  var userDraw = UserDrawDetailEntity().obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();


}
