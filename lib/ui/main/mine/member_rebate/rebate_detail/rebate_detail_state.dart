import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/rebate_detail_entity.dart';
import 'package:leisure_games/ui/bean/rebate_detail_params.dart';

class RebateDetailState {
  RebateDetailState() {
    ///Initialize variables
  }

  var params = RebateDetailParams();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var data = RxList<RebateDetailEntity>.empty(growable: true);


}
