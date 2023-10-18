import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

class QuotaConversionState {
  QuotaConversionState() {
    ///Initialize variables
  }


  var dropdownValue = LanguageMenuEntity(language: "CNY钱包", icon: ImageX.icon_rmb_grey).obs;

  late List<LanguageMenuEntity> country = [
    dropdownValue.value,
    LanguageMenuEntity(language: "USDT钱包", icon: ImageX.icon_ustd2_grey),
  ];

  var leftAccount = "主账号".obs;
  var rightAccount = "AG".obs;

  late List<String> accounts = [leftAccount.value,rightAccount.value,];


  late TabController tabController;


}
