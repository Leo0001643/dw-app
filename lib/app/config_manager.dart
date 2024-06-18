
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
  static const channel_shouxin = "shouxin";
  static const channel_aomen = "aomen";
  static const channel_fuyuan = "fuyuan";


  static String siteid(){
    switch(channelName){
      case channel_dw:
        return "9000";
      case channel_boya:
        return "9003";
      case channel_fuyuan:
        return "9005";
      case channel_shouxin:
        return "9006";
      case channel_aomen:
        return "9007";
      default:
        return "9000";
    }
  }

  static String defaultHost(){
    switch(channelName){
      case channel_dw:
        return "https://9000vlmdm4.kj99883.com/";
      case channel_boya:
        return "https://9003zgvmyj.mzm3mzdj.com/";
      case channel_fuyuan:
        return "https://9005mmq5y2.mzm3mzdj.com/";
      case channel_shouxin:
        return "https://9006owm4yz.mzm3mzdj.com/";
      case channel_aomen:
        return "https://9007mzg3nj.mzm3mzdj.com/";
      default:
        return "https://9000vlmdm4.kj99883.com/";
    }
  }

  static String defaultHostWs(){
    switch(channelName){
      case channel_dw:
        return "wss://9000ywfjn2.uy4ayov.com/";
      case channel_boya:
        return "wss://9003mzg3nm.njc2n2m5.com/";
      case channel_fuyuan:
        return "wss://9005zmzjzm.njc2n2m5.com:443/";
      case channel_shouxin:
        return "wss://9006ogm5nj.njc2n2m5.com:443/";
      case channel_aomen:
        return "wss://9007mdg4ym.njc2n2m5.com:443/";
      default:
        return "wss://9000ywfjn2.uy4ayov.com/";
    }
  }

  ///澳门仅支持中英文
  //中文 英文 越南语 ,const Locale("vi","VI"),const Locale('en','US')
  static List<Locale> locales(){
    switch(channelName){
      case channel_aomen:
        return [const Locale('zh','ZH'),const Locale('en','US')];
      default:
        return [const Locale('zh','ZH'),const Locale('en','US'),const Locale("vi","VI")];
    }
  }

  ///默认支持中英文越南语
  static List<LanguageMenuEntity> country (){
    switch(channelName){
      case channel_dw:
        return [LanguageMenuEntity(language: "中文简体", icon: ImageX.icon_zh,locale: locales()[0]),
          LanguageMenuEntity(language: "English", icon: ImageX.icon_us,locale: locales()[1]),
          LanguageMenuEntity(language: "Tiếng Việt", icon: ImageX.icon_vi,locale: locales()[2]),
        ];
      default:
        return [LanguageMenuEntity(language: "中文简体", icon: ImageX.icon_zh,locale: locales()[0]),
          LanguageMenuEntity(language: "English", icon: ImageX.icon_us,locale: locales()[1]),
        ];
    }
  }

  ///更多
  static String hyld(){
    switch(channelName){
      case channel_dw:
        return Intr().hyld_dw;
      case channel_boya:
        return Intr().hyld_boya;
      case channel_fuyuan:
        return Intr().hyld_fuyuan;
      case channel_shouxin:
        return Intr().hyld_shouxin;
      case channel_aomen:
        return Intr().hyld_aomen;
      default:
        return Intr().hyld_dw;
    }
  }

  ///更多
  static String guojizhan2023(){
    switch(channelName){
      case channel_dw:
        return Intr().guojizhan2023_dw;
      case channel_boya:
        return Intr().guojizhan2023_boya;
      case channel_fuyuan:
        return Intr().guojizhan2023_fuyuan;
      case channel_shouxin:
        return Intr().guojizhan2023_shouxin;
      case channel_aomen:
        return Intr().guojizhan2023_aomen;
      default:
        return Intr().guojizhan2023_dw;
    }
  }

  ///首页站点logo
  static String icStationHomeZ(){
    switch(channelName){
      case channel_dw:
        return AppData.localeIndex() == 0 ? ImageX.ic_dw_home : ImageX.ic_dw_home_en;
      case channel_boya:
        return AppData.localeIndex() == 0 ? ImageX.ic_boya_home : ImageX.ic_boya_home_en;
      case channel_fuyuan:
        return AppData.localeIndex() == 0 ? ImageX.ic_fuyuan_home :ImageX.ic_fuyuan_home_en;
      case channel_shouxin:
        return AppData.localeIndex() == 0 ? ImageX.ic_shouxin_home :ImageX.ic_shouxin_home_en;
      case channel_aomen:
        return AppData.localeIndex() == 0 ? ImageX.ic_aomen_home :ImageX.ic_aomen_home_en;
      default:
        return AppData.localeIndex() == 0 ? ImageX.ic_dw_home : ImageX.ic_dw_home_en;
      }
  }

  ///亚马逊存储桶
  static String getBucket(){
    switch(channelName){
      case channel_dw:
        return "gjz";
      case channel_boya:
        return "boya";
      case channel_fuyuan:
        return "fuyuan";
      case channel_shouxin:
        return "shouxin";
      case channel_aomen:
        return "aomen";
      default:
        return "gjz";
    }
  }

  ///阿里云存储桶
  static String fileName(){
    switch(channelName){
      case channel_dw:
        return "line_gjz.json";
      case channel_boya:
        return "line_boya.json";
      case channel_fuyuan:
        return "line_fuyuan.json";
      case channel_shouxin:
        return "line_shouxin.json";
      case channel_aomen:
        return "line_aomen.json";
      default:
        return "line_gjz.json";
    }
  }


}


///目前支持 dw  boya fuyuan shouxin  aomen
String channelName = const String.fromEnvironment('CHANNEL', defaultValue: 'boya');

