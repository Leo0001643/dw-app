import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';

class PreferentialState {
  PreferentialState() {
    ///Initialize variables
  }

  var tabs = [Intr().quanbu,Intr().chongzhi,Intr().qita];

  ///优惠活动
  var promotions = PromotionTypeEntity();

  var list = RxList<PromotionTypeKey>.empty(growable: true);

  var scaffoldKey = GlobalKey<ScaffoldState>();

}
