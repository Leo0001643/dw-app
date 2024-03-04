import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_offline/recharge_offline_page.dart';
import 'package:leisure_games/ui/main/recharge/recharge_category/recharge_online/recharge_online_page.dart';

class RechargeCategoryState {
  RechargeCategoryState() {
    ///Initialize variables
    pages = [RechargeOnlinePage(), RechargeOfflinePage()];
  }

  var title = "".obs;

  var tabs = [Intr().xianshang,Intr().xianxia];

  late PageController pageController;
  late TabController tabController;

  late List<Widget> pages;

  //是否支持在线
  var supportOnline = false.obs;
  var paymentInfo = PaymentListBanks();

  ///支付方式
  var paymentList = PaymentListEntity().obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();




}
