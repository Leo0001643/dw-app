import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/config_manager.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

class SelectLanguageState {
  SelectLanguageState() {
    ///Initialize variables
  }


  List<LanguageMenuEntity> country = ConfigManager.country();

  late var dropdownValue = country[AppData.localeIndex()].obs;

  late var countryList = country.obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();


}
