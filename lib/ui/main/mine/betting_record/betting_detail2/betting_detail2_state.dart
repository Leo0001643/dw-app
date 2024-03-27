import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/bet_detail_list_entity.dart';
import 'package:leisure_games/ui/bean/bet_record_group_entity.dart';

class BettingDetail2State {
  BettingDetail2State() {
    ///Initialize variables
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var betRecordGroupRecord=BetRecordGroupRecord().obs;
  var originetRecordGroupRecord=BetRecordGroupRecord().obs;
  var title = "".obs;

  var record =BetDetailListRecord().obs;


}
