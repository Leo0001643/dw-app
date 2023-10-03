import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SpStorage {
  /// singleton setup start
  static late final SpStorage _instance = SpStorage._internal();
  static late SharedPreferences preferences;

  factory SpStorage() => _instance;

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  SpStorage._internal();

  /// singleton setup end

  static const _tokenKey = 'token';

  static String? get jwtToken {
    var val = preferences.getString('token');
    return val != null ? 'Bearer $val' : null;
  }

  static void setToken(String jwt) {
    preferences.setString(_tokenKey, jwt);
  }

  static void removeToken() {
    preferences.remove(_tokenKey);
    preferences.remove('sportToken');
  }

  static bool get isLastRemember {
    return preferences.getBool('isLastRemember') ?? false;
  }

  static set isLastRemember(bool value) {
    preferences.setBool('isLastRemember', value);
  }

  static String get invitePerson {
    return preferences.getString('tuiJianRen') ?? "";
  }

  static set invitePerson(String value) {
    preferences.setString('tuiJianRen', value);
  }

  static Map<String, dynamic>? get getRememberMe {
    var result = preferences.getString('rememberMe');
    return result != null ? json.decode(result) : null;
  }
  static String? get getUserName {
    return preferences.getString('userName');
  }
  static String? get getPassword {
    return preferences.getString('password');
  }
  static String? get getSportToken{
    return preferences.getString('sportToken');
  }

  static String getValue(String key) {
    return preferences.getString(key) ?? "";
  }

  static void setRememberMe(Map<String, dynamic> form) {
    var value = json.encode(form);
    preferences.setString('rememberMe', value);
  }

  static void setUserName(String userName) {
    preferences.setString('userName', userName);
  }
  static void setSportToken(String token) {
    preferences.setString('sportToken', token);
  }
  static void setPassword(String password) {
    preferences.setString('password', password);
  }

  //音量
  static double get getVolume {
    return preferences.getDouble('volumeNum') ?? 0.5;
  }

  static void setVolume(double volume) {
    preferences.setDouble('volumeNum', volume);
  }

  //本地话D盾返回的客服地址
  static void setCustomeUrl(String url) {
    preferences.setString('customUrl', url);
  }

  //本地话D盾返回的客服地址
  static void setValue(String key, String value) {
    preferences.setString(key, value);
  }

  static String get getCustomeUrl {
    return preferences.getString('customUrl') ?? "https://www.baidu.com";
  }

  ///睁眼还是闭眼
  static bool get isShowBalance {
    return preferences.getBool('isShowBalance') ?? true;
  }

  static set isShowBalance(bool? isShow) {
    preferences.setBool('isShowBalance', isShow ?? true);
  }
}
