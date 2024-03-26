
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';

class Constants {

  // static const host = "http://soptj9qq.com";
  static const host = "https://9000vlmdm4.kj99883.com/";

  // static const base_url = "$host:8860";
  static const contact = "$host/m/#/detail/Contact";
  static const hongbao = "http://soptj9qq.com/m/#/Hongbao/%s/%s/%s";

  static const  FONT_STD = "ITCAvantGardeStd";

  static const imageType = 2;//图片类别[1:A网pC,2:A网移动,3:c原pC,4:C网移动,5:B网PC,6:B网移动],示例值(1)
  static const pageSize = 20;

  // static const websocket = "ws://ws.by4aocqs.com:9999";
  static const host_ws = "wss://9000ywfjn2.uy4ayov.com/";

  static const web_gjz = "http://soptj9qq.com";

  static const PC28 = "PC28";

  ///PC28游戏类型
  static const fastbtb28Code = "fastbtb28";
  static const jndx28Code = "jndx28";
  static const keno28Code = "keno28";
  static const tw28Code = "tw28";



  static const html_btc = "https://btc.com";
  static const html_blockchain = "https://www.blockchain.com/btc/unconfirmed-transactions";



  static String model(){
    var info = AppData.deviceInfo();
    return "${info.name}_${info.systemName}_${info.systemVersion}";
  }

  static String version(){
    return AppData.deviceInfo().version.em();
  }


  static const code_usdt = "usdt";
  static const code_wangyin = "wangyin";
  static const code_zhifubao = "zhifubao";
  static const code_weixin = "weixin";
  static const code_ysfzf = "ysfzf";
  static const code_caifutong = "caifutong";
  static const code_qmf = "qmf";
  static const code_jingdong = "jingdong";




}



