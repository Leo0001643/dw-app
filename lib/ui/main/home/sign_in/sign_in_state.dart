import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/check_in_info_entity.dart';

class SignInState {
  SignInState() {
    ///Initialize variables
  }

  // var currentDate = "".obs;

  ///签到信息
  var checkInfo = CheckInInfoEntity().obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();


}
