import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/app_theme.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';

import 'select_theme_state.dart';

class SelectThemeLogic extends GetxController {
  final SelectThemeState state = SelectThemeState();

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


  void changeTheme(bool theme){
    state.selectTheme.value = theme;
    state.selectTheme.refresh();
    logger("当前主题${AppTheme().currentTheme()}");
    if(AppData.theme() != theme){
      AppData.setTheme(theme);
      Get.changeThemeMode(theme ? ThemeMode.light:ThemeMode.dark);
      eventBus.fire(ChangeMainPageEvent(0));//转到首页显示
      Get.until((ModalRoute.withName(Routes.main)));
    }
  }



}
