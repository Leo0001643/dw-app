
import 'package:flutter/material.dart';
import 'package:leisure_games/app/app_data.dart';

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




}



