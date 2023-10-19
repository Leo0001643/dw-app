import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_offline/recharge_offline_page.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_online/recharge_online_page.dart';

class RechargeCategoryState {
  RechargeCategoryState() {
    ///Initialize variables
    pages = [RechargeOnlinePage(), RechargeOfflinePage()];
  }

  var title = "支付宝".obs;


  late PageController pageController;
  late List<Widget> pages;

  //是否支持在线
  var supportOnline = false.obs;

}
