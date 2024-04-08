import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/utils/refresh_change_notifier.dart';
import 'package:leisure_games/ui/bean/history_hall_entity.dart';
import 'package:leisure_games/ui/bean/history_lotto_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryLotteryState {
  HistoryLotteryState() {
    ///Initialize variables
  }

  var title = "".obs;

  var hall = HistoryHall();

  var page = 1;

  var list = RxList<HistoryLottoEntity>.empty(growable: true);

  late RefreshController refreshController;
  var refreshListener = RefreshChangeNotifier();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var PC28HashTable = { //lid和gameCode的映射表，PC28所有种类
    '10': 'keno28',//加拿大PC28
    '11': 'xy28',//北京PC28
    '12': 'cq28',//重庆PC28
    '13': 'xj28',//新疆PC28
    '31': 'tw28',//台湾宾果PC28
    '32': 'jndx28',//加拿大西PC28
    '33': 'slfk28',//斯洛伐克PC28
    '34': 'elg28',//俄勒冈PC28
    '46': 'fastbtb28',//比特币1分PC28
  };


}
