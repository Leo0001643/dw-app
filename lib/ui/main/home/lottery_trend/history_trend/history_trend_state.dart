import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/dew_info_entity.dart';

class HistoryTrendState {
  HistoryTrendState() {
    ///Initialize variables
  }

  var nums = ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28"];

  var title = "".obs;


  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];

  ///左侧数据源 期号
  var leftData = RxList<String>.empty(growable: true);
  ///右侧数据源
  var data = RxList<List<String>>.empty(growable: true);
  ///右侧中奖号码
  var lottoData = RxMap<int,int>.identity();

  ///数据源
  var info = DewInfoEntity();
  var scaffoldKey = GlobalKey<ScaffoldState>();

}
