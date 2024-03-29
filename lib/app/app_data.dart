import 'dart:convert';
import 'dart:developer';

import 'package:android_id/android_id.dart';
import 'package:common_utils/common_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';
import 'package:leisure_games/ui/bean/device_info.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/room_copy_writing_entity.dart';
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
    prefs = await SharedPreferences.getInstance();
    logger("初始化完成${DateTime.now().toString()}");
    final deviceInfoPlugin = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();

    if (GetPlatform.isAndroid) {
      var deviceInfo = await deviceInfoPlugin.androidInfo;
      var deviceId = await const AndroidId().getId();
      setDeviceInfo(DeviceInfo(
          name: deviceInfo.model,
          systemName: deviceInfo.brand,
          systemVersion: deviceInfo.version.release,
          model: deviceInfo.product,
          version: packageInfo.version,
          deviceId: deviceId));
    } else if (GetPlatform.isIOS) {
      var deviceInfo = await deviceInfoPlugin.iosInfo;
      setDeviceInfo(DeviceInfo(
          name: deviceInfo.name,
          systemName: deviceInfo.systemName,
          systemVersion: deviceInfo.systemVersion,
          model: deviceInfo.model,
          version: packageInfo.version,
          deviceId: deviceInfo.identifierForVendor));
    }
    ///初始化网络库
    HttpService.doInit();
    return Future.value(true);
  }

  static void setLocaleIndex(int index) {
    prefs?.setInt("locale_index", index);
  }

  static int localeIndex() {
    return prefs?.getInt("locale_index") ?? 0;
  }

  static void setTheme(bool theme) {
    prefs?.setBool("theme", theme);
  }

  static bool theme() {
    return prefs?.getBool("theme") ?? true;
  }

  static void setBgMusic(bool open) {
    prefs?.setBool("bg_music", open);
  }

  static void setGestureValue(String gestureValue) {
    prefs?.setString("gestureValue", gestureValue);
  }
  static String getGestureValue() {
    return prefs?.getString("gestureValue") ?? "";
  }

  // static void setJymm(bool open) {
  //   prefs?.setBool("bg_jymm", open);
  // }
  // static bool bgJymm() {
  //   return prefs?.getBool("bg_jymm") ?? true;
  // }

  static bool bgMusic() {
    return prefs?.getBool("bg_music") ?? true;
  }

  static void setPromptTone(bool open) {
    prefs?.setBool("prompt_tone", open);
  }

  static bool promptTone() {
    return prefs?.getBool("prompt_tone") ?? true;
  }

  static void setFengpanAnim(bool open) {
    prefs?.setBool("fengpan_anim", open);
  }

  static bool fengpanAnim() {
    return prefs?.getBool("fengpan_anim") ?? true;
  }

  static void setKaijiangAnim(bool open) {
    prefs?.setBool("kaijiang_anim", open);
  }

  static bool kaijiangAnim() {
    return prefs?.getBool("kaijiang_anim") ?? true;
  }

  static void setDaojishiAnim(bool open) {
    prefs?.setBool("daojishi_anim", open);
  }

  static bool daojishiAnim() {
    return prefs?.getBool("daojishi_anim") ?? true;
  }

  static void setZhongjiangAnim(bool open) {
    prefs?.setBool("zhongjiang_anim", open);
  }

  static bool zhongjiangAnim() {
    return prefs?.getBool("zhongjiang_anim") ?? true;
  }

  static void setDeviceInfo(DeviceInfo info) {
    prefs?.setString("device_info", jsonEncode(info.toJson()));
  }

  static DeviceInfo deviceInfo() {
    var json = prefs?.getString("device_info") ?? "";
    if(json.isEmpty) {
      return DeviceInfo(name:"name",model: "samsung");
    }

    return DeviceInfo.fromJson(jsonDecode(json));
  }

  static void setWallet(bool rmb) {
    prefs?.setBool("wallet_mode", rmb);
  }

  ///默认钱包类型 RMB 和 USDT
  static bool wallet() {
    return prefs?.getBool("wallet_mode") ?? true;
  }

  // ///简易密码
  // static void setSimplePwd(String pwd) {
  //   prefs?.setString("simple_pwd", pwd);
  // }
  //
  // static String simplePwd() {
  //   return prefs?.getString(
  //         "simple_pwd",
  //       ) ??
  //       "";
  // }

  static void setLoginPwd(String pwd) {
    prefs?.setString("login_pwd", pwd);
  }

  static String loginPwd() {
    return prefs?.getString("login_pwd",) ?? "";
  }

  static void setLoginUser(String user) {
    prefs?.setString("login_user", user);
  }

  static String loginUser() {
    return prefs?.getString("login_user",) ?? "";
  }

  static void setUser(LoginUserEntity user) {
    prefs?.setString("user", jsonEncode(user.toJson()));
  }

  static LoginUserEntity? user() {
    var json = prefs?.getString("user") ?? "";
    if (isEmpty(json)) {
      return null;
    } else {
      return LoginUserEntity.fromJson(jsonDecode(json));
    }
  }

  static bool isLogin() => unEmpty(user()?.oid);

  static List<RoomCopyWritingEntity>? roomWritingEntity(){
    var json = prefs?.getString("room_writing_entity") ?? "";
    if (isEmpty(json)) {
      return null;
    } else {
      return JsonUtil.getObjectList(json, (v) => RoomCopyWritingEntity.fromJson(v as Map<String,dynamic>));
    }
  }

  static void saveRoomWritingEntity(String roomWriting){
    prefs?.setString("room_writing_entity", roomWriting);
  }


  static String base_url = "";

  static void setBaseUrl(String baseUrl) {
    base_url = baseUrl;
    prefs?.setString("base_url", baseUrl);
  }

  ///从缓存获取base_url
  static String baseUrl(){
    if(unEmpty(base_url)) return base_url;
    base_url = prefs?.getString("base_url") ?? "";
    if(isEmpty(base_url)){
      base_url = Constants.host;
    }
    return base_url;
  }

  static String base_wsurl = "";

  static void setBaseWsUrl(String baseWsUrl) {
    base_wsurl = baseWsUrl;
    prefs?.setString("base_wsurl", baseWsUrl);
  }

  ///从缓存获取base_wsurl
  static String baseWsUrl(){
    if(unEmpty(base_wsurl)) return base_wsurl;
    base_wsurl = prefs?.getString("base_wsurl") ?? "";
    if(isEmpty(base_wsurl)){
      base_wsurl = "${Constants.host_ws}?language=s%";
    }
    return base_wsurl;
  }

  static void setOssApi(BaseApiOssEntity entity){
    prefs?.setString("oss_api", jsonEncode(entity.toJson()));
  }

  static BaseApiOssEntity? ossApi() {
    var json = prefs?.getString("oss_api") ?? "";
    if (isEmpty(json)) {
      return null;
    } else {
      return BaseApiOssEntity.fromJson(jsonDecode(json));
    }
  }

  static void clear() {
    prefs?.remove("user");
  }



}
