import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

class QuotaConversionState {
  QuotaConversionState() {
    ///Initialize variables
  }


  var dropdownValue = LanguageMenuEntity(language: Intr().wallet_cny, icon: ImageX.icon_rmb_grey).obs;

  late List<LanguageMenuEntity> country = [
    dropdownValue.value,
    LanguageMenuEntity(language: Intr().wallet_usdt, icon: ImageX.icon_ustd2_grey),
  ];

  var leftAccount = "主账号".obs;
  var rightAccount = "AG".obs;

  late List<String> accounts = [leftAccount.value,rightAccount.value,];


  late TabController tabController;

  var tabs = [Intr().gezhanghumingxi,Intr().huazhuanjilu];


}
