import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_entity.dart';
import 'package:leisure_games/ui/bean/bet_record_group_entity.dart';

class BettingDetailState {
  BettingDetailState() {
    ///Initialize variables
  }
  final GlobalKey<ScaffoldState> scaffoldMineKey = GlobalKey<ScaffoldState>();

  var betRecordGroupRecord=BetRecordGroupRecord().obs;
  var title = "投注详情".obs;

  var record =BetDetailItemEntity().obs;

  var betamount=0.0.obs;
  var validamount=0.0.obs;
  var winlose=0.0.obs;
  var betCount=0.0.obs;
}
