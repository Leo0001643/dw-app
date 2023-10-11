
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
  String get hyld => 'hyld'.tr;
  String get qqzlxd => 'qqzlxd'.tr;
  String get register => 'register'.tr;
  String get login => 'login'.tr;
  String get grzx => 'grzx'.tr;
  String get rmbqb => 'rmbqb'.tr;
  String get yue => 'yue'.tr;
  String get edzh => 'edzh'.tr;
  String get pcxq => 'pcxq'.tr;
  String get tzjl => 'tzjl'.tr;
  String get jymm => 'jymm'.tr;
  String get dyy => 'dyy'.tr;
  String get bjyy => 'bjyy'.tr;
  String get tsy => 'tsy'.tr;
  String get wgys => 'wgys'.tr;
  String get qs => 'qs'.tr;
  String get dx => 'dx'.tr;
  String get qk => 'qk'.tr;
  String get fxghy => 'fxghy'.tr;
  String get ycfx => 'ycfx'.tr;
  String get xzapp => 'xzapp'.tr;
  String get lxjbhb => 'lxjbhb'.tr;
  String get logout => 'logout'.tr;
  String get xzndyy => 'xzndyy'.tr;
  String get sszcbz => 'sszcbz'.tr;
  String get zxndbz => 'zxndbz'.tr;
  String get bbdh => 'bbdh'.tr;
  String get lxkf => 'lxkf'.tr;
  String get yhm => 'yhm'.tr;
  String get qsryhm => 'qsryhm'.tr;
  String get mm => 'mm'.tr;
  String get qsrmm => 'qsrmm'.tr;
  String get wjmm => 'wjmm'.tr;
  String get cjygzxh => 'cjygzxh'.tr;
  String get kfzx => 'kfzx'.tr;
  String get xszxkf => 'xszxkf'.tr;
  String get qthwnfw => 'qthwnfw'.tr;
  String get djjr => 'djjr'.tr;
  String get dxtxsz => 'dxtxsz'.tr;
  String get fpdx => 'fpdx'.tr;
  String get cksl => 'cksl'.tr;
  String get kjjgdx => 'kjjgdx'.tr;
  String get djsdx => 'djsdx'.tr;
  String get wgsz => 'wgsz'.tr;
  String get qzb => 'qzb'.tr;
  String get kxh => 'kxh'.tr;
  String get cjzh => 'cjzh'.tr;
  String get wszhzm => 'wszhzm'.tr;
  String get zsxm => 'zsxm'.tr;
  String get yzm => 'yzm'.tr;
  String get qsrzcyzm => 'qsrzcyzm'.tr;
  String get wywdbty => 'wywdbty'.tr;
  String get yhtk => 'yhtk'.tr;
  String get and => 'and'.tr;
  String get ysxy => 'ysxy'.tr;
  String get yyzh => 'yyzh'.tr;
  String get ytxyhkhmyz => 'ytxyhkhmyz'.tr;


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
      "hyld":"欢迎来到xxx",
      "qqzlxd":"全球最领先的xxxx",
      "register":"注册",
      "login":"登录",
      "grzx":"个人中心",
      "rmbqb":"人民币钱包",
      "yue":"余额：",
      "edzh":"额度转换",
      "pcxq":"PC详情",
      "tzjl":"投注记录",
      "jymm":"简易密码",
      "dyy":"多语言",
      "bjyy":"背景音乐",
      "tsy":"提示音",
      "wgys":"外观/颜色",
      "qs":"浅色",
      "dx":"动效",
      "qk":"全开",
      "fxghy":"分享给好友",
      "ycfx":"一次分享,无限佣金",
      "xzapp":"下载APP",
      "lxjbhb":"立享888金币红包",
      "logout":"退出",
      "xzndyy":"选择您的语言",
      "sszcbz":"搜索支持币种",
      "zxndbz":"选择您的币种",
      "bbdh":"币币兑换",
      "lxkf":"联系客服",
      "yhm":"用户名",
      "qsryhm":"请输入用户名",
      "mm":"密码",
      "qsrmm":"请输入密码",
      "wjmm":"忘记密码?",
      "cjygzxh":"创建一个新账户",
      "kfzx":"客服中心",
      "xszxkf":"24小时在线客服",
      "qthwnfw":"全天候在线为您服务",
      "djjr":"点击进入",
      "dxtxsz":"动效提醒设置",
      "fpdx":"封盘动效",
      "cksl":"查看示例",
      "kjjgdx":"开奖结果动效",
      "djsdx":"倒计时动效",
      "wgsz":"外观设置",
      "qzb":"气质白",
      "kxh":"酷炫黑",
      "cjzh":"创建账户",
      "wszhzm":"8-12位数字或字母",
      "zsxm":"真实姓名",
      "yzm":"验证码",
      "qsrzcyzm":"请输入左侧验证码",
      "wywdbty":"我已阅读并同意",
      "yhtk":"《用户条款》",
      "and":"和",
      "ysxy":"《隐私协议》",
      "yyzh":"已有账户?",
      "ytxyhkhmyz":"与提现银行卡户名一致",



    },
  };


}

