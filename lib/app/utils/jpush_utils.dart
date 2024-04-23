
import 'package:jpush_flutter/jpush_flutter.dart';

/// Author: Soushin-932707629@qq.com
/// Date: 2024/4/23 18:15
/// Description: 推送工具类
class JPushUtils{

  JPushUtils._internal();

  static JPushUtils? instance;

  static getInstance() {
    instance ??= JPushUtils._internal();
    return instance;
  }

  factory JPushUtils() => getInstance();

  var jpush = JPush();

  void init(){
    jpush.setAuth(enable: true);
    jpush.setup();
  }



}

