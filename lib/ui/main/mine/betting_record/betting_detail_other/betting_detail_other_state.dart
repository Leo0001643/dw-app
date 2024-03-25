import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_child_entity.dart';
import 'package:leisure_games/ui/bean/bet_detail_list_entity.dart';
import 'package:leisure_games/ui/bean/bet_record_group_entity.dart';

class BettingDetailOtherState {
  BettingDetailOtherState() {
    ///Initialize variables
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var betDetailItemEntity=BetDetailListRecordRecord().obs;
  var betRecordGroupRecord=BetRecordGroupRecord().obs;
  var title = Intr().xiangqing.obs;

  var record =BetDetailItemChildEntity().obs;


}
