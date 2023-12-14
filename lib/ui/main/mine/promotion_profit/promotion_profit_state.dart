import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/spread_promos_data_entity.dart';
import 'package:leisure_games/ui/bean/spread_user_entity.dart';

class PromotionProfitState {
  PromotionProfitState() {
    ///Initialize variables
  }

  ///推广列表
  var spreadPromos = List<SpreadPromosDataList>.empty(growable: true);

  ///会员列表
  var spreadUser = List<SpreadUserEntity>.empty(growable: true);

  var tabs = [Intr().tuiguanghongli,Intr().huiyuanliebiao,];


  var showList = RxList.empty(growable: true);

  var userCode = "".obs;

  var userLink = "".obs;

  var qrLinkData = Uint8List(0).obs;


}
