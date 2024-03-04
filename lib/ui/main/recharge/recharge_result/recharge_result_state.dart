import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/digiccy_deposit_data_entity.dart';

class RechargeResultState {
  RechargeResultState() {
    ///Initialize variables
  }

  var result = DigiccyDepositDataEntity().obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();



}
