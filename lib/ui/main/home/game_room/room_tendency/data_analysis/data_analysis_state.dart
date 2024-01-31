import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/data_analysis/pages/data_analysis_child_page.dart';

class DataAnalysisState {
  DataAnalysisState() {
    ///Initialize variables
    pageController = PageController();
    pages.assignAll([const DataAnalysisChildPage(),const DataAnalysisChildPage(),const DataAnalysisChildPage(),const DataAnalysisChildPage(),]);
  }
  var pages = <Widget>[];

  var totalTitle = RxList.empty(growable: true);

  var formTitle = RxList.empty(growable: true);

  var tabs = [Intr().tema,Intr().diyiqiu,Intr().dierqiu,Intr().disanqiu,];


  ///默认tab在特码
  int tabIndex = 0;

  late PageController pageController;
}
