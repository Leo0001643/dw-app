import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharePreferencesUtils {

  static Future<dynamic> saveToLocalMap(String key, dynamic value) async {

    final com = Completer();
    final future = com.future;
    try {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String jsonEncodestr = jsonEncode(value);
      prefs.setString(key, jsonEncodestr);
      com.complete(true);
      print('======= json序列化的待存储字符串 ======== : ' + jsonEncodestr);
    } catch (err) {

      com.complete(false);
      print(' save is err ,,,,,');
      print(err.toString());
    }
    return future;
  }

  static Future<dynamic> deleteFromLocalMap(String key) async {

    final com = Completer();
    final future = com.future;
    try {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(key);
      com.complete(true);
      print(' delete is ok ,,,,,');
    } catch (err) {

      com.complete(false);
      print(' delete is err ,,,,,');
      print(err.toString());
    }
    return future;
  }

  static Future<dynamic> readFromLocalMap(String key) async {

    final com = Completer();
    final future = com.future;
    try {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String values = prefs.get(key) as String;
      var obj = jsonDecode(values);
      com.complete(obj);
      print('======= json反序列化后的dynamic对象 ======== : ' + obj.toString());
    } catch (err) {

      // 读取失败, 仅返回一个null, 防止外部不catch,引起报错, 但是外部就需要做好判空
      com.complete(null);
      print(' read is err ,,,,,');
    }
    return future;
  }
}