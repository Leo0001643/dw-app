import 'package:leisure_games/app/logger.dart';
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



}
