import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';

class SelectThemeState {
  SelectThemeState() {
    ///Initialize variables
  }

  var selectTheme = AppData.theme().obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();

}
