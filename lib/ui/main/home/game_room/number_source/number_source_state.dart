import 'package:flutter/material.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/main/home/game_room/number_source/number_description/number_description_page.dart';
import 'package:leisure_games/ui/main/home/game_room/number_source/prize_number/prize_number_page.dart';
import 'package:leisure_games/ui/main/home/game_room/number_source/tool_check/tool_check_page.dart';

class NumberSourceState {
  NumberSourceState() {
    ///Initialize variables

    pageController = PageController();
    pages = [PrizeNumberPage(),NumberDescriptionPage(),ToolCheckPage(),];
  }

  late TabController tabController;

  late PageController pageController;
  late List<Widget> pages;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var tabs = [Intr().jianghaozhanshi,Intr().jianghaoshuoming,Intr().gongjujiaoyan];

}
