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

  static void setLoginPwd(String user,String pwd) {
    prefs?.setString("login_pwd_$user", pwd);
  }


  static String loginPwd(String user) {
    return prefs?.getString("login_pwd_$user",) ?? "";
  }

  static void setValidUser(String user) {
    ///保证最近一次登录的用户始终都在队列的最后面
    if(unEmpty(loginUser(user))){
      prefs?.remove("valid_user_$user");
    }
    prefs?.setBool("valid_user_$user", true);
  }


  static bool isValidUser(String user) {
    return prefs?.getBool("valid_user_$user",) ??false;
  }


  static void setLoginUser(String user) {
    ///保证最近一次登录的用户始终都在队列的最后面
    if(unEmpty(loginUser(user))){
      prefs?.remove("login_user_$user");
    }
    prefs?.setString("login_user_$user", user);
  }

  static String loginUser(String user) {
    return prefs?.getString("login_user_$user",) ?? "";
  }
  
  static String lastLoginUser(){
    var users = List.empty(growable: true);
    prefs?.getKeys().forEach((element) {
      if(element.startsWith("login_user")){
        users.add(prefs?.getString(element) ?? "");
      }
    });
    return users.lastOrNull ?? '';
  }

  static String lastLoginPwd(){
    return loginPwd(lastLoginUser());
  }

  ///为当前登录用户设置手势密码
  static void setGestureValue(String gestureValue) {
    prefs?.setString("gestureValue_${AppData.lastLoginUser()}", gestureValue);
  }

  ///获取当前登录用户的手势密码
  static String getGestureValue({String? user}) {
    user = user ?? AppData.lastLoginUser();
    return prefs?.getString("gestureValue_$user") ?? "";
  }

  ///通过手势密码获取对应的用户
  static String getUserByGesture(String gestureValue){
    var users = List.empty(growable: true);
    prefs?.getKeys().forEach((element) {
      ///找到所有手势密码的key
      if(element.startsWith("gestureValue")){
        //对比其中是否有匹配的手势密码
        if(gestureValue == prefs?.getString(element)){
          ///如果有匹配的手势密码则返回用户
          users.add(element.replaceFirst("gestureValue_", ""));
        }
      }
    });
    return users.lastOrNull ?? '';
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

  ///适配多渠道环境 如果换成其他渠道本地host就跟线路里的不是一回事了 所以得处理一下多渠道的环境问题
  static void checkBaseUrl(BaseApiOssEntity value){
    if(isEmpty(prefs?.getString("base_url"))){
      if(unEmpty(value.baseAPIs)){
        setBaseUrl(value.baseAPIs!.first);
      }
    }
    if(isEmpty(prefs?.getString("base_wsurl"))){
      if(unEmpty(value.webSockets)){
        setBaseWsUrl(value.webSockets!.first);
      }
    }
  }



}
