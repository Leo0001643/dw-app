import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

import 'select_language_state.dart';

class SelectLanguageLogic extends GetxController {
  final SelectLanguageState state = SelectLanguageState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  void changeLanguage(int index,LanguageMenuEntity item){
    state.dropdownValue.value = item;
    state.dropdownValue.refresh();
    logger("当前语言环境${Get.locale.toString()}");
    if(unEmpty(item.locale) && item.locale != Get.locale){
      AppData.setLocaleIndex(index);
      Get.updateLocale(item.locale!);
      eventBus.fire(ChangeMainPageEvent(0));//转到首页显示
      Get.until((ModalRoute.withName(Routes.main)));
    }
  }





}
