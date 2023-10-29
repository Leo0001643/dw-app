import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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

  }

  var pages = [LotteryResultPage(),DataAnalysisPage(),DoubleQueuePage(),DsDewPage(),DxDewPage(),NumberTrendPage()];


  late PageController pageController;

}
