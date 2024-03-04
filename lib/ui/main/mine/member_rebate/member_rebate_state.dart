import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/back_water_desc_entity.dart';
import 'package:leisure_games/ui/bean/back_water_entity.dart';
import 'package:leisure_games/ui/bean/constitute_ratio_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

class MemberRebateState {
  MemberRebateState() {
    ///Initialize variables
  }

  // var currentTime = Intr().jinri.obs;
  // late var times = [currentTime.value,Intr().day_7,Intr().day_15,Intr().day_30,];

  var selectTime = PaymentListBanks(bankName: Intr().jintian,id: 0).obs;
  late List<PaymentListBanks> filterTime = [
    selectTime.value,
    PaymentListBanks(bankName: Intr().day_7,id: 1),
    PaymentListBanks(bankName: Intr().day_15,id: 2),
    PaymentListBanks(bankName: Intr().day_30,id: 3),
  ];

  ///返水说明
  BackWaterDescEntity? backWaterDesc;

  ///组合占比
  var constituteRatio = ConstituteRatioEntity().obs;

  ///回水统计
  var list = RxList<BackWaterEntity>.empty(growable: true);

  var scaffoldKey = GlobalKey<ScaffoldState>();


}
