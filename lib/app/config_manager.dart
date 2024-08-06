
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
  static const channel_gdvip = "gdvip";
  static const channel_leyou = "leyou";
  static const channel_jsgj = "jsgj";
  static const channel_longmen = "longmen";
  static const channel_jbp = "jbp";
  static const channel_yygj = "yygj";
  static const channel_zhixin = "zhixin";


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
      case channel_gdvip:
        return "9008";
      case channel_leyou:
        return "9009";
      case channel_jsgj:
        return "9010";
      case channel_longmen:
        return "9011";
      case channel_jbp:
        return "9012";
      case channel_yygj:
        return "9013";
      case channel_zhixin:
        return "9015";
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
      case channel_gdvip:
        return "https://112.74.43.160:5564/";
      case channel_leyou:
        return "https://9009mjlkow.mzm3mzdj.com/";
      case channel_jsgj:
        return "https://112.74.43.160:5564/";
      case channel_longmen:
        return "https://112.74.43.160:5564/";
      case channel_jbp:
        return "https://112.74.43.160:5564/";
      case channel_yygj:
        return "https://112.74.43.160:5564/";
      case channel_zhixin:
        return "https://112.74.43.160:5564/";
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
      case channel_gdvip:
        return "wss://112.74.43.160:5574/";
      case channel_leyou:
        return "wss://9009odvhod.njc2n2m5.com:443/";
      case channel_jsgj:
        return "wss://112.74.43.160:5574/";
      case channel_longmen:
        return "wss://112.74.43.160:5564/";
      case channel_jbp:
        return "wss://112.74.43.160:5564/";
      case channel_yygj:
        return "wss://112.74.43.160:5564/";
      case channel_zhixin:
        return "wss://112.74.43.160:5564/";
      default:
        return "wss://9000ywfjn2.uy4ayov.com/";
    }
  }

  ///仅DW支持中/英/越南文
  //中文 英文 越南语 ,const Locale("vi","VI"),const Locale('en','US')
  static List<Locale> locales(){
    switch(channelName){
      case channel_dw:
        return [const Locale('zh','ZH'),const Locale('en','US'),const Locale("vi","VI")];
      default:
        return [const Locale('zh','ZH'),const Locale('en','US')];
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
      case channel_gdvip:
        return Intr().hyld_gdvip;
      case channel_leyou:
        return Intr().hyld_leyou;
      case channel_jsgj:
        return Intr().hyld_jsgj;
      case channel_longmen:
        return Intr().hyld_longmen;
      case channel_jbp:
        return Intr().hyld_jbp;
      case channel_yygj:
        return Intr().hyld_yygj;
      case channel_zhixin:
        return Intr().hyld_zhixin;
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
      case channel_gdvip:
        return Intr().guojizhan2023_gdvip;
      case channel_jsgj:
        return Intr().guojizhan2023_jsgj;
      case channel_longmen:
        return Intr().guojizhan2023_longmen;
      case channel_jbp:
        return Intr().guojizhan2023_jbp;
      case channel_yygj:
        return Intr().guojizhan2023_yygj;
      case channel_zhixin:
        return Intr().guojizhan2023_zhixin;
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
      case channel_gdvip:
        return AppData.localeIndex() == 0 ? ImageX.ic_gdvip_home :ImageX.ic_gdvip_home_en;
      case channel_leyou:
        return AppData.localeIndex() == 0 ? ImageX.ic_leyou_home :ImageX.ic_leyou_home_en;
      case channel_jsgj:
        return AppData.localeIndex() == 0 ? ImageX.ic_jsgj_home :ImageX.ic_jsgj_home_en;
      case channel_longmen:
        return AppData.localeIndex() == 0 ? ImageX.ic_longmen_home :ImageX.ic_longmen_home_en;
      case channel_jbp:
        return AppData.localeIndex() == 0 ? ImageX.ic_jbp_home :ImageX.ic_jbp_home_en;
      case channel_yygj:
        return AppData.localeIndex() == 0 ? ImageX.ic_yygj_home :ImageX.ic_yygj_home_en;
      case channel_zhixin:
        return AppData.localeIndex() == 0 ? ImageX.ic_zhixin_home :ImageX.ic_zhixin_home_en;
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
      case channel_gdvip:
        return "gdvip";
      case channel_leyou:
        return "leyou";
      case channel_jsgj:
        return "jsgj";
      case channel_longmen:
        return "longmen";
      case channel_jbp:
        return "jbp";
      case channel_yygj:
        return "yygj";
      case channel_zhixin:
        return "zhixin";
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
      case channel_gdvip:
        return "line_gdvip.json";
      case channel_leyou:
        return "line_leyou.json";
      case channel_jsgj:
        return "line_jsgj.json";
      case channel_longmen:
        return "line_longmen.json";
      case channel_jbp:
        return "line_jbp.json";
      case channel_yygj:
        return "line_yygj.json";
      case channel_zhixin:
        return "line_zhixin.json";
      default:
        return "line_gjz.json";
    }
  }


  ///启动页图片
  static String getSplashImage(){
    switch(channelName){
      case channel_dw:
        return ImageX.dw_bg_init;
      case channel_boya:
        return ImageX.boya_bg_init;
      case channel_fuyuan:
        return ImageX.fuyuan_bg_init;
      case channel_shouxin:
        return ImageX.shouxin_bg_init;
      case channel_aomen:
        return ImageX.aomen_bg_init;
      case channel_gdvip:
        return ImageX.gdvip_bg_init;
      case channel_leyou:
        return ImageX.leyou_bg_init;
      case channel_jsgj:
        return ImageX.jsgj_bg_init;
      case channel_longmen:
        return ImageX.longmen_bg_init;
      case channel_jbp:
        return ImageX.jbp_bg_init;
      case channel_yygj:
        return ImageX.yygj_bg_init;
      case channel_zhixin:
        return ImageX.zhixin_bg_init;
      default:
        return ImageX.dw_bg_init;
    }
  }

}


///目前支持 dw(9000) boya(9003) fuyuan(9005) shouxin(9006) aomen(9007) gdvip(9008)
/// leyou(9009) jsgj(9010) longmen(9011) jbp(9012) yygj(9013) zhixin(9015)
String channelName = const String.fromEnvironment('CHANNEL', defaultValue: 'zhixin');





