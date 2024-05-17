import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';

class PreferentialState {
  PreferentialState() {
    ///Initialize variables
  }

  var tabs = RxList<String>.empty(growable: true);

  ///优惠活动
  var promotions = PromotionTypeEntity();

  var list = RxList<PromotionTypeKey>.empty(growable: true);

  var scaffoldKey = GlobalKey<ScaffoldState>();

  TabController? tabController;



}
