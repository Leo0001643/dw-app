import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/data_analysis/data_analysis_page.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/double_queue/double_queue_page.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/ds_dew/ds_dew_page.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/dx_dew/dx_dew_page.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/lottery_result/lottery_result_page.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/number_trend/number_trend_page.dart';

class RoomTendencyState {
  RoomTendencyState() {
    ///Initialize variables
    pageController = PageController();

    pages.assignAll([const LotteryResultPage(),const DataAnalysisPage(),const DoubleQueuePage(),const DsDewPage(),
      const DxDewPage(),const NumberTrendPage()]);
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var pages = <Widget>[];

  late PageController pageController;

  ///房型信息
  Pc28LottoRoomsTables? room;



}
