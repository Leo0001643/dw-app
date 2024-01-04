import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_child_entity.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_entity.dart';
import 'package:leisure_games/ui/bean/bet_record_group_entity.dart';

class BettingDetailChildState {
  BettingDetailChildState() {
    ///Initialize variables
  }
  final GlobalKey<ScaffoldState> scaffoldMineKey = GlobalKey<ScaffoldState>();

  var betDetailItemEntity=BetDetailItemEntity().obs;
  var betRecordGroupRecord=BetRecordGroupRecord().obs;
  var title = "投注详情".obs;

  var record =BetDetailItemChildEntity().obs;


}
