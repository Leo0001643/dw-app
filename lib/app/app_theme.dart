
import 'package:flutter/material.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/res/colorx.dart';

class AppTheme{
  AppTheme._internal();



  static AppTheme? instance;

  static getInstance() {
    instance ??= AppTheme._internal();
    return instance;
  }

  factory AppTheme() => getInstance();


  ///当前语言环境
  ThemeMode currentTheme(){
    return AppData.theme() ? ThemeMode.light:ThemeMode.dark;
  }

  var lightTheme = ThemeData(
    brightness: Brightness.dark,
    cardColor: Colors.white,
    primaryColor: ColorX.color_fc243b,
  );

  var darkTheme = ThemeData(
    brightness: Brightness.light,
    cardColor: Colors.white38,
    primaryColor: ColorX.color_fc243b,
  );

}



