
import 'package:get/get.dart';

class Intr extends Translations{
  Intr._internal();

  static Intr? instance;

  static getInstance() {
    instance ??= Intr._internal();
    return instance;
  }

  factory Intr() => getInstance();

  String get language => 'language'.tr;
  String get count => 'count'.tr;
  String get storage => 'storage'.tr;
  String get theme => 'theme'.tr;
  String get connect => 'connect'.tr;
  String get permission => 'permission'.tr;
  String get webview => 'webview'.tr;
  String get pictureSelector => 'pictureSelector'.tr;
  String get rx_dart => 'rx_dart'.tr;
  String get multiple => 'multiple'.tr;
  String get userEventBus => 'userEventBus'.tr;
  String get home => 'home'.tr;
  String get mine => 'mine'.tr;
  String get preferential => 'preferential'.tr;
  String get customer_service => 'customer_service'.tr;
  String get charge => 'charge'.tr;
  String get tixian => 'tixian'.tr;
  String get choujiang => 'choujiang'.tr;
  String get zoushi => 'zoushi'.tr;
  String get activity => 'activity'.tr;
  String get other => 'other'.tr;
  String get sayHello => 'sayHello'.tr;
  String get ac_unit => 'ac_unit'.tr;
  String get access_alarm => 'access_alarm'.tr;
  String get accessibility => 'accessibility'.tr;
  String get account_balance => 'account_balance'.tr;
  String get account_balance_wallet => 'account_balance_wallet'.tr;
  String get add_a_photo => 'add_a_photo'.tr;
  String get add_moderator => 'add_moderator'.tr;
  String get add_shopping_cart => 'add_shopping_cart'.tr;
  String get getx_get => 'getx_get'.tr;
  String get getx_post => 'getx_post'.tr;
  String get remen => 'remen'.tr;
  String get zuijin => 'zuijin'.tr;
  String get shoucang => 'shoucang'.tr;
  String get gaunyuwomen => 'gaunyuwomen'.tr;
  String get guanwangjieshao => 'guanwangjieshao'.tr;
  String get xiazhaiyingyong => 'xiazhaiyingyong'.tr;
  String get pingtaifuwu => 'pingtaifuwu'.tr;
  String get yonghuzhongxin => 'yonghuzhongxin'.tr;
  String get huiyuan => 'huiyuan'.tr;
  String get chongzhijilu => 'chongzhijilu'.tr;
  String get qiandaochoujiang => 'qiandaochoujiang'.tr;
  String get jishuzhichi => 'jishuzhichi'.tr;
  String get fangjiechijiaocheng => 'fangjiechijiaocheng'.tr;
  String get shiyongbangzhu => 'shiyongbangzhu'.tr;
  String get shedingyuyan => 'shedingyuyan'.tr;
  String get morenyuyan => 'morenyuyan'.tr;
  String get tiaoguo => 'tiaoguo'.tr;
  String get queren => 'queren'.tr;
  String get xuanzeyuyan => 'xuanzeyuyan'.tr;
  String get xuanzeqianbao => 'xuanzeqianbao'.tr;
  String get morenqianbao => 'morenqianbao'.tr;
  String get shedingqianbao => 'shedingqianbao'.tr;
  String get rmb => 'rmb'.tr;
  String get dollar => 'dollar'.tr;
  String get thb => 'thb'.tr;
  String get vnd => 'vnd'.tr;




  @override
  Map<String, Map<String, String>> get keys => {
    'zh_ZH': {
      "app_name": "Flutter示例",
      "home": "首页",
      "mine": "我的",
      "preferential": "优惠",
      "charge": "充值",
      "tixian": "提现",
      "choujiang": "抽奖",
      "zoushi": "走势",
      "customer_service": "客服",
      "activity": "活动",
      "other": "其他",
      "greet": "你好~",
      "language": "语言",
      "count": "GetX计数器",
      "storage": "轻量存储",
      "connect": "网络请求",
      "theme": "主题",
      "dio_get":"dio get",
      "dio_post":"dio post",
      "getx_get": "getx Get",
      "getx_post": "getx Post",
      "permission": "权限",
      "webview": "浏览器",
      "pictureSelector": "图片选择器",
      "rx_dart": "RxDart使用",
      "pick_time": "选择时间",
      "sayHello": "你好",
      "multiple": "多布局",
      "userEventBus": "欢迎使用EventBus",
      "permissionDenied": "权限已被拒绝",
      "ac_unit": "雪花",
      "access_alarm": "闹钟",
      "accessibility": "健康",
      "account_balance": "酒店",
      "account_balance_wallet": "钱包",
      "add_a_photo": "摄影",
      "add_moderator": "安全",
      "add_shopping_cart": "购物",
      "remen": "热门",
      "zuijin": "最近",
      "shoucang": "收藏",
      "gaunyuwomen": "关于我们",
      "guanwangjieshao": "官网介绍",
      "xiazhaiyingyong": "下载应用",
      "pingtaifuwu": "平台服务",
      "yonghuzhongxin": "用户中心",
      "huiyuan": "会员",
      "chongzhijilu": "充值记录",
      "qiandaochoujiang": "签到抽奖",
      "jishuzhichi": "技术支持",
      "fangjiechijiaocheng": "防劫持教程",
      "shiyongbangzhu": "使用帮助",
      "xuanzeyuyan":"选择语言",
      "shedingyuyan":"* 请选择默认语言，您可以稍后在“更多”或“我的-设置”中进行设定",
      "morenyuyan":"默认语言",
      "tiaoguo":"跳过",
      "queren":"确认",
      "xuanzeqianbao":"请选择钱包",
      "morenqianbao":"默认钱包",
      "shedingqianbao":"* 请选择默认钱包，您可以稍后在“更多”或“我的-钱包”中进行设定",
      "rmb":"人民币（CNY）",
      "dollar":"美元（US）",
      "thb":"泰铢（Thai Baht）",
      "vnd":"越南盾（VND）",

    },
    'en_US': {
      "app_name": "Flutter Demo",
      "home": "Home",
      "mine": "Mine",
      "preferential": "Preferential",
      "charge": "充值",
      "tixian": "提现",
      "choujiang": "抽奖",
      "zoushi": "走势",
      "customer_service": "客服",
      "activity": "activity",
      "other": "other",
      "greet": "hello~",
      "language": "Language",
      "count": "GetX Count",
      "storage": "Storage",
      "connect": "Connect",
      "theme": "Theme",
      "dio_get":"dio get",
      "dio_post":"dio post",
      "getx_get": "getx Get",
      "getx_post": "getx Post",
      "permission": "Permission",
      "webview": "WebView",
      "pictureSelector": "Picture Selector",
      "rx_dart": "RxDart",
      "pick_time": "Pick a time",
      "sayHello": "hello {name}",
      "multiple": "Multiple layout",
      "userEventBus": "Welcome to EventBus",
      "permissionDenied": "Permission denied",
      "ac_unit": "ac unit",
      "access_alarm": "access alarm",
      "accessibility": "accessibility",
      "account_balance": "account balance",
      "account_balance_wallet": "account balance wallet",
      "add_a_photo": "add a photo",
      "add_moderator": "add moderator",
      "add_shopping_cart": "add shopping cart",
      "remen": "热门",
      "zuijin": "最近",
      "shoucang": "收藏",
      "gaunyuwomen": "关于我们",
      "guanwangjieshao": "官网介绍",
      "xiazhaiyingyong": "下载应用",
      "pingtaifuwu": "平台服务",
      "yonghuzhongxin": "用户中心",
      "huiyuan": "会员",
      "chongzhijilu": "充值记录",
      "qiandaochoujiang": "签到抽奖",
      "jishuzhichi": "技术支持",
      "fangjiechijiaocheng": "防劫持教程",
      "shiyongbangzhu": "使用帮助",
      "xuanzeyuyan":"选择语言",
      "shedingyuyan":"* 请选择默认语言，您可以稍后在“更多”或“我的-设置”中进行设定",
      "morenyuyan":"默认语言",
      "tiaoguo":"跳过",
      "queren":"确认",
      "xuanzeqianbao":"请选择钱包",
      "morenqianbao":"默认钱包",
      "shedingqianbao":"* 请选择默认钱包，您可以稍后在“更多”或“我的-钱包”中进行设定",
      "rmb":"人民币（CNY）",
      "dollar":"美元（US）",
      "thb":"泰铢（Thai Baht）",
      "vnd":"越南盾（VND）",
    },
    'de_DE': {
      "app_name": "Flutter示例",
      "home": "首页",
      "preferential": "Preferential",
      "charge": "充值",
      "tixian": "提现",
      "choujiang": "抽奖",
      "zoushi": "走势",
      "customer_service": "客服",
      "mine": "Mine",
      "activity": "活动",
      "other": "其他",
      "greet": "你好~",
      "language": "语言",
      "count": "GetX计数器",
      "storage": "轻量存储",
      "connect": "网络请求",
      "theme": "主题",
      "dio_get":"dio get",
      "dio_post":"dio post",
      "getx_get": "getx Get",
      "getx_post": "getx Post",
      "permission": "权限",
      "webview": "浏览器",
      "pictureSelector": "图片选择器",
      "rx_dart": "RxDart使用",
      "pick_time": "选择时间",
      "sayHello": "你好",
      "multiple": "多布局",
      "userEventBus": "欢迎使用EventBus",
      "permissionDenied": "权限已被拒绝",
      "ac_unit": "雪花",
      "access_alarm": "闹钟",
      "accessibility": "健康",
      "account_balance": "酒店",
      "account_balance_wallet": "钱包",
      "add_a_photo": "摄影",
      "add_moderator": "安全",
      "add_shopping_cart": "购物",
      "remen": "热门",
      "zuijin": "最近",
      "shoucang": "收藏",
      "gaunyuwomen": "关于我们",
      "guanwangjieshao": "官网介绍",
      "xiazhaiyingyong": "下载应用",
      "pingtaifuwu": "平台服务",
      "yonghuzhongxin": "用户中心",
      "huiyuan": "会员",
      "chongzhijilu": "充值记录",
      "qiandaochoujiang": "签到抽奖",
      "jishuzhichi": "技术支持",
      "fangjiechijiaocheng": "防劫持教程",
      "shiyongbangzhu": "使用帮助",
      "xuanzeyuyan":"选择语言",
      "shedingyuyan":"* 请选择默认语言，您可以稍后在“更多”或“我的-设置”中进行设定",
      "morenyuyan":"默认语言",
      "tiaoguo":"跳过",
      "queren":"确认",
      "xuanzeqianbao":"请选择钱包",
      "morenqianbao":"默认钱包",
      "shedingqianbao":"* 请选择默认钱包，您可以稍后在“更多”或“我的-钱包”中进行设定",
      "rmb":"人民币（CNY）",
      "dollar":"美元（US）",
      "thb":"泰铢（Thai Baht）",
      "vnd":"越南盾（VND）",
    },
    'id_ID': {
      "app_name": "Flutter示例",
      "home": "首页",
      "preferential": "Preferential",
      "charge": "充值",
      "tixian": "提现",
      "choujiang": "抽奖",
      "zoushi": "走势",
      "customer_service": "客服",
      "mine": "Mine",
      "activity": "活动",
      "other": "其他",
      "greet": "你好~",
      "language": "语言",
      "count": "GetX计数器",
      "storage": "轻量存储",
      "connect": "网络请求",
      "theme": "主题",
      "dio_get":"dio get",
      "dio_post":"dio post",
      "getx_get": "getx Get",
      "getx_post": "getx Post",
      "permission": "权限",
      "webview": "浏览器",
      "pictureSelector": "图片选择器",
      "rx_dart": "RxDart使用",
      "pick_time": "选择时间",
      "sayHello": "你好",
      "multiple": "多布局",
      "userEventBus": "欢迎使用EventBus",
      "permissionDenied": "权限已被拒绝",
      "ac_unit": "雪花",
      "access_alarm": "闹钟",
      "accessibility": "健康",
      "account_balance": "酒店",
      "account_balance_wallet": "钱包",
      "add_a_photo": "摄影",
      "add_moderator": "安全",
      "add_shopping_cart": "购物",
      "remen": "热门",
      "zuijin": "最近",
      "shoucang": "收藏",
      "gaunyuwomen": "关于我们",
      "guanwangjieshao": "官网介绍",
      "xiazhaiyingyong": "下载应用",
      "pingtaifuwu": "平台服务",
      "yonghuzhongxin": "用户中心",
      "huiyuan": "会员",
      "chongzhijilu": "充值记录",
      "qiandaochoujiang": "签到抽奖",
      "jishuzhichi": "技术支持",
      "fangjiechijiaocheng": "防劫持教程",
      "shiyongbangzhu": "使用帮助",
      "xuanzeyuyan":"选择语言",
      "shedingyuyan":"* 请选择默认语言，您可以稍后在“更多”或“我的-设置”中进行设定",
      "morenyuyan":"默认语言",
      "tiaoguo":"跳过",
      "queren":"确认",
      "xuanzeqianbao":"请选择钱包",
      "morenqianbao":"默认钱包",
      "shedingqianbao":"* 请选择默认钱包，您可以稍后在“更多”或“我的-钱包”中进行设定",
      "rmb":"人民币（CNY）",
      "dollar":"美元（US）",
      "thb":"泰铢（Thai Baht）",
      "vnd":"越南盾（VND）",
    },
  };


}

