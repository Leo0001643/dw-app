import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/utils/refresh_change_notifier.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';
import 'package:leisure_games/ui/bean/point_record_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PointsRecordState {
  PointsRecordState() {
    ///Initialize variables
  }


  var selectTime = PaymentListBanks(bankName: Intr().jintian,id: 0).obs;
  late List<PaymentListBanks> filterTime = [
    selectTime.value,
    PaymentListBanks(bankName: Intr().day_7,id: 1),
    PaymentListBanks(bankName: Intr().day_15,id: 2),
  ];
  ///页数
  var page = 1;

  late RefreshController refreshController;
  var refreshListener = RefreshChangeNotifier();

  var list = RxList<PointRecordRecord>.empty(growable: true);
  var scaffoldKey = GlobalKey<ScaffoldState>();


}
