
import 'dart:ui';

import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

/// Author: Soushin-932707629@qq.com
/// Date: 2024/4/24 15:44
/// Description: 多站点配置
class ConfigManager {

  static const channel_dw = "dw";
  static const channel_boya = "boya";


  static String siteid(){
    if(channelName == channel_boya){
      return "9003";
    } else {
      return "9000";
    }
  }

  static String defaultHost(){
    if(channelName == channel_boya){
      return "https://9003zgvmyj.mzm3mzdj.com/";
    } else {
      return "https://9000vlmdm4.kj99883.com/";
    }
  }

  static String defaultHostWs(){
    if(channelName == channel_boya){
      return "wss://9003mzg3nm.njc2n2m5.com/";
    } else {
      return "wss://9000ywfjn2.uy4ayov.com/";
    }
  }

  //中文 英文 越南语 ,const Locale("vi","VI"),const Locale('en','US')
  static List<Locale> locales(){
    return [const Locale('zh','ZH'),const Locale('en','US'),const Locale("vi","VI")];
  }

  static List<LanguageMenuEntity> country (){
    return [LanguageMenuEntity(language: "中文简体", icon: ImageX.icon_zh,locale: locales()[0]),
      LanguageMenuEntity(language: "English", icon: ImageX.icon_us,locale: locales()[1]),
      LanguageMenuEntity(language: "Tiếng Việt", icon: ImageX.icon_vi,locale: locales()[2]),
    ];
  }

  ///更多
  static String hyld(){
    if(channelName == channel_boya){
      return Intr().hyld_boya;
    }else {
      return Intr().hyld_dw;
    }
  }

  ///更多
  static String guojizhan2023(){
    if(channelName == channel_boya){
      return Intr().guojizhan2023_boya;
    }else {
      return Intr().guojizhan2023_dw;
    }
  }

  ///首页站点logo
  static String icStationHomeZ(){
    if(channelName == channel_boya){
      return AppData.localeIndex() == 0 ? ImageX.ic_boya_home : ImageX.ic_boya_home_en;
    }else {
      return AppData.localeIndex() == 0 ? ImageX.ic_dw_home : ImageX.ic_dw_home_en;
    }
  }

  ///亚马逊存储桶
  static String getBucket(){
    if(channelName == channel_boya){
      return "boya";
    }else {
      return "gjz";
    }
  }

  ///阿里云存储桶
  static String fileName(){
    if(channelName == channel_boya){
      return "line_boya.json";
    }else{
      return "line_gjz.json";
    }
  }


}


///目前支持 dw  boya
String channelName = const String.fromEnvironment('CHANNEL', defaultValue: 'dw');

