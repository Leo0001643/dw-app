import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/protect_entity.dart';
import 'package:leisure_games/ui/bean/web_config_entity.dart';
import 'package:leisure_games/ui/main/recharge/recharge_page.dart';

import '/app/res/dimens.dart';
import 'customer_service/customer_service_page.dart';
import 'home/home_page.dart';
import 'mine/mine_page.dart';
import 'preferential/preferential_page.dart';

class MainState {

  MainState() {
    ///Initialize variables
    pageController = PageController();

    pages = [HomePage(), PreferentialPage(),RechargePage(), CustomerServicePage(),MinePage()];
  }


  var count = Dimens.i_40.obs;
  var selectedIndex = 0.obs;

  late PageController pageController;
  TabController? tabController;
  late List<Widget> pages;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  ///服务配置
  WebConfigEntity? webConfig;

  ///站点维护
  ProtectEntity? protect;

  var stationHost = "";


}
