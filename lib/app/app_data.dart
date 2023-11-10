import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/ui/bean/device_info.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/app/global.dart';

/// 应用内数据缓存处理
/// @author SouShin
/// @time 2021/8/10 10:22
class AppData {
  // static Box? box;
  static SharedPreferences? prefs;

  static Future<bool> initData() async {
    await SharedPreferences.getInstance().then((value) =>
        {prefs = value, logger("初始化完成${DateTime.now().toString()}")});
    final deviceInfoPlugin = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();
    if(GetPlatform.isAndroid){
      var deviceInfo = await deviceInfoPlugin.androidInfo;
      setDeviceInfo(DeviceInfo(name: deviceInfo.model,systemName: deviceInfo.brand,
          systemVersion: deviceInfo.version.release,model: deviceInfo.product,version: packageInfo.version));
    }else if(GetPlatform.isIOS){
      var deviceInfo = await deviceInfoPlugin.iosInfo;
      setDeviceInfo(DeviceInfo(name: deviceInfo.name,systemName: deviceInfo.systemName,
          systemVersion: deviceInfo.systemVersion,model: deviceInfo.model,version: packageInfo.version));
    }
    return Future.value(true);
  }

  static void setLocaleIndex(int index){
    prefs?.setInt("locale_index", index);
  }

  static int localeIndex() {
    return prefs?.getInt("locale_index") ?? 0;
  }

  static void setTheme(bool theme){
    prefs?.setBool("theme", theme);
  }

  static bool theme() {
    return prefs?.getBool("theme") ?? true;
  }

  static void setDeviceInfo(DeviceInfo info){
    prefs?.setString("device_info", jsonEncode(info.toJson()));
  }

  static DeviceInfo deviceInfo() {
    var json = prefs?.getString("device_info") ?? "";
    return DeviceInfo.fromJson(jsonDecode(json));
  }

  static bool isLogin()=> false;



}
