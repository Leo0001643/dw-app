import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

class SPUtil{

  static SPUtil? _singleton;
  static SharedPreferences? _preferences;
  static final Lock _lock = Lock();
  factory SPUtil(){
    return _singleton ??= SPUtil._initial();
  }

  SPUtil._initial() {
    //为什么在这里需要新写init方法 主要是在命名构造中不能使用async/await
    SPUtil.getInstance();
  }


  static Future<SPUtil?> getInstance() async {
    if (_singleton == null) {
      await _lock.synchronized(() async {
        if (_singleton == null) {
          // keep local instance till it is fully initialized.
          // 保持本地实例直到完全初始化。
          var singleton = SPUtil._();
          await singleton._init();
          _singleton = singleton;
        }
      });
    }
    return _singleton;
  }

  SPUtil._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// put object.
  static Future<bool> putObject(String key, Object value) {
    if(_preferences !=null){
      return _preferences!.setString(key, json.encode(value));
    }else{
      return Future.value(false);
    }
  }

  // SPUtil._pre(SharedPreferences prefs) {
  //   _preferences = prefs;
  // }
  ///设置String类型的
  Future<bool> setString(key, value) {
    if(_preferences !=null){
      return _preferences!.setString(key, value);
    }else{
      return Future.value(false);
    }
  }
  ///设置setStringList类型的
  Future<bool> setStringList(key, value) {

    if(_preferences !=null){
      return _preferences!.setStringList(key, value);
    }else{
      return Future.value(false);
    }

  }
  ///设置setBool类型的
  Future<bool> setBool(key, value) {


    if(_preferences !=null){
      return _preferences!.setBool(key, value);
    }else{
      return Future.value(false);
    }
  }
  ///设置setDouble类型的
  Future<bool> setDouble(key, value) {
    if(_preferences !=null){
      return _preferences!.setDouble(key, value);
    }else{
      return Future.value(false);
    }
  }
  ///设置setInt类型的
  Future<bool> setInt(key, value) {
    if(_preferences !=null){
      return _preferences!.setInt(key, value);
    }else{
      return Future.value(false);
    }
  }
  ///存储Json类型的
  Future<bool> setJson(key, value) {
    if(_preferences !=null){
      value = jsonEncode(value);
      return _preferences!.setString(key, value);
    }else{
      return Future.value(false);
    }
  }
  ///通过泛型来获取数据
  T? get<T>(key) {
    var result = _preferences?.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }

  ///存储Json类型的
  List<String>? getStringList(key) {

    if(_preferences !=null){
      return _preferences!.getStringList(key);
    }else{
      return null;
    }
  }

  ///获取JSON
  Map<String, dynamic>? getJson(key) {
    String result = _preferences?.getString(key) ?? '';
    if (result.isNotEmpty) {
      return jsonDecode(result);
    }
    return null;
  }

  ///清除全部
  Future<bool>? clean() {
    return _preferences?.clear();
  }
  ///移除某一个
  Future<bool>? remove(key) {
    return _preferences?.remove(key);
  }
}