
import 'dart:ui';

import 'package:get/get.dart';

class Intr extends Translations{
  Intr._internal();

  static Intr? instance;

  static getInstance() {
    instance ??= Intr._internal();
    return instance;
  }

  factory Intr() => getInstance();


  //中文 英文 越南语
  var locales = [const Locale('zh','ZH'),const Locale('en','US'),const Locale("vi","VI")];


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
  String get tab_pcfj => 'tab_pcfj'.tr;
  String get tab_cp => 'tab_cp'.tr;
  String get tab_zr => 'tab_zr'.tr;
  String get tab_ty => 'tab_ty'.tr;
  String get tab_by => 'tab_by'.tr;
  String get tab_dz => 'tab_dz'.tr;
  String get ytxyhkhmyz => 'ytxyhkhmyz'.tr;
  String get dangqianzaixian => 'dangqianzaixian'.tr;
  String get peilvshuoming => 'peilvshuoming'.tr;
  String get wanfaguizhe => 'wanfaguizhe'.tr;
  String get youxishuyu => 'youxishuyu'.tr;
  String get xiazhujiqiao => 'xiazhujiqiao'.tr;
  String get wanfaguizhe_jieshao => 'wanfaguizhe_jieshao'.tr;
  String get youxishuyu_jieshao => 'youxishuyu_jieshao'.tr;
  String get xiazhujiqiao_jieshao => 'xiazhujiqiao_jieshao'.tr;
  String get card_ptf => 'card_ptf'.tr;
  String get card_gjf => 'card_gjf'.tr;
  String get card_gbf => 'card_gbf'.tr;
  String get haoyuan => 'haoyuan'.tr;
  String get zhudan => 'zhudan'.tr;
  String get mipai => 'mipai'.tr;
  String get qushi => 'qushi'.tr;
  String get dixqi => 'dixqi'.tr;
  String get zongyue => 'zongyue'.tr;
  String get touzhu => 'touzhu'.tr;
  String get bet_da => 'bet_da'.tr;
  String get bet_xiao => 'bet_xiao'.tr;
  String get bet_dan => 'bet_dan'.tr;
  String get bet_shuang => 'bet_shuang'.tr;
  String get di => 'di'.tr;
  String get qi => 'qi'.tr;
  String get zhudan_ => 'zhudan_'.tr;
  String get zongji_ => 'zongji_'.tr;
  String get qiehuanfangjian => 'qiehuanfangjian'.tr;
  String get confirm => 'confirm'.tr;
  String get cancel => 'cancel'.tr;
  String get tema => 'tema'.tr;
  String get diyiqiu => 'diyiqiu'.tr;
  String get dierqiu => 'dierqiu'.tr;
  String get disanqiu => 'disanqiu'.tr;
  String get qingshurujine => 'qingshurujine'.tr;
  String get zongji => 'zongji'.tr;
  String get end => 'end'.tr;
  String get xiazhuxiangqing => 'xiazhuxiangqing'.tr;
  String get quanbujilu => 'quanbujilu'.tr;
  String get xiazhujine => 'xiazhujine'.tr;
  String get keyingjine => 'keyingjine'.tr;
  String get xiaoji => 'xiaoji'.tr;
  String get xbi => 'xbi'.tr;
  String get qihao_ => 'qihao_'.tr;
  String get wallet_cny => 'wallet_cny'.tr;
  String get wallet_usdt => 'wallet_usdt'.tr;
  String get danhao => 'danhao'.tr;
  String get neirong => 'neirong'.tr;
  String get guanfanghaoyuan => 'guanfanghaoyuan'.tr;
  String get jianghaozhanshi => 'jianghaozhanshi'.tr;
  String get jianghaoshuoming => 'jianghaoshuoming'.tr;
  String get gongjujiaoyan => 'gongjujiaoyan'.tr;
  String get daojishi => 'daojishi'.tr;
  String get qihao => 'qihao'.tr;
  String get kaijianghaoma => 'kaijianghaoma'.tr;
  String get haoyuanjinqi => 'haoyuanjinqi'.tr;
  String get wanzhenghaoyuanzhanshi => 'wanzhenghaoyuanzhanshi'.tr;
  String get zhuaqushijian => 'zhuaqushijian'.tr;
  String get shuominghaoyuan => 'shuominghaoyuan'.tr;
  String get bitebipc28quhaojizhi => 'bitebipc28quhaojizhi'.tr;
  String get zhuahaoyuan => 'zhuahaoyuan'.tr;
  String get sha256zhuanhua => 'sha256zhuanhua'.tr;
  String get shijinzhizhuanhua => 'shijinzhizhuanhua'.tr;
  String get shengchengzuihzhonghaoma => 'shengchengzuihzhonghaoma'.tr;
  String get zhuahaoyuan_jieshao => 'zhuahaoyuan_jieshao'.tr;
  String get sha256zhuanhua_jieshao => 'sha256zhuanhua_jieshao'.tr;
  String get shijinzhizhuanhua_jieshao => 'shijinzhizhuanhua_jieshao'.tr;
  String get shengchengzuihzhonghaoma_jieshao => 'shengchengzuihzhonghaoma_jieshao'.tr;
  String get shuruduiyinghaoyuan => 'shuruduiyinghaoyuan'.tr;
  String get jiaoyan => 'jiaoyan'.tr;
  String get jiaoyanjieguo => 'jiaoyanjieguo'.tr;
  String get sha256zhuanhuahzi => 'sha256zhuanhuahzi'.tr;
  String get quqianshiliuwei => 'quqianshiliuwei'.tr;
  String get shijinweizhuanhuan => 'shijinweizhuanhuan'.tr;
  String get chuyierde64cifang => 'chuyierde64cifang'.tr;
  String get shuoming => 'shuoming'.tr;
  String get shuoming_jieshao => 'shuoming_jieshao'.tr;
  String get haoyuanchaxun => 'haoyuanchaxun'.tr;
  String get dianjifuzhi => 'dianjifuzhi'.tr;
  String get jiaoyanshuoming => 'jiaoyanshuoming'.tr;
  String get jiaoyanshuoming1 => 'jiaoyanshuoming1'.tr;
  String get jiaoyanshuoming2 => 'jiaoyanshuoming2'.tr;
  String get jiaoyanshuoming3 => 'jiaoyanshuoming3'.tr;
  String get jiaoyanshuoming4 => 'jiaoyanshuoming4'.tr;
  String get zuizhongkaijianghaoma => 'zuizhongkaijianghaoma'.tr;
  String get dixqitouzhu => 'dixqitouzhu'.tr;
  String get dixqikaijiang => 'dixqikaijiang'.tr;
  String get fengpanzhong => 'fengpanzhong'.tr;
  String get shuaxin => 'shuaxin'.tr;
  String get kaijiangjieguo => 'kaijiangjieguo'.tr;
  String get shujufenxi => 'shujufenxi'.tr;
  String get shuangmianchanglong => 'shuangmianchanglong'.tr;
  String get danshuangluzhu => 'danshuangluzhu'.tr;
  String get daxiaoluzhu => 'daxiaoluzhu'.tr;
  String get haomazhoushi => 'haomazhoushi'.tr;
  String get lx_tongji => 'lx_tongji'.tr;
  String get xianshiqishu_ => 'xianshiqishu_'.tr;
  String get zhi => 'zhi'.tr;
  String get jixiao => 'jixiao'.tr;
  String get jida => 'jida'.tr;
  String get dalu => 'dalu'.tr;
  String get zhupanlu => 'zhupanlu'.tr;
  String get hao_value => 'hao_value'.tr;
  String get qingshuruyouximingcheng => 'qingshuruyouximingcheng'.tr;
  String get xuanzhe => 'xuanzhe'.tr;
  String get quanbuyouxi => 'quanbuyouxi'.tr;
  String get shoucangla => 'shoucangla'.tr;
  String get qiandaoyouli => 'qiandaoyouli'.tr;
  String get jifen => 'jifen'.tr;
  String get benyueyiqian => 'benyueyiqian'.tr;
  String get zongjifen_ => 'zongjifen_'.tr;
  String get lijiqiandao => 'lijiqiandao'.tr;
  String get day_yi => 'day_yi'.tr;
  String get day_er => 'day_er'.tr;
  String get day_san => 'day_san'.tr;
  String get day_si => 'day_si'.tr;
  String get day_wu => 'day_wu'.tr;
  String get day_liu => 'day_liu'.tr;
  String get day_ri => 'day_ri'.tr;
  String get jifenyaojiang => 'jifenyaojiang'.tr;
  String get jifenmeici => 'jifenmeici'.tr;
  String get lianyao5 => 'lianyao5'.tr;
  String get lianyao10 => 'lianyao10'.tr;
  String get lianyao15 => 'lianyao15'.tr;
  String get lianyao20 => 'lianyao20'.tr;
  String get huodongguizhe => 'huodongguizhe'.tr;
  String get jiangjintiqu => 'jiangjintiqu'.tr;
  String get nianyueri => 'nianyueri'.tr;
  String get bencijiangli => 'bencijiangli'.tr;
  String get gongxiwancheng => 'gongxiwancheng'.tr;
  String get xiaciqiandao => 'xiaciqiandao'.tr;
  String get mingtianjixue => 'mingtianjixue'.tr;
  String get gongxininhuode => 'gongxininhuode'.tr;
  String get jiangjin => 'jiangjin'.tr;
  String get cishu => 'cishu'.tr;




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
      "tab_pcfj":"PC房间",
      "tab_cp":"彩票",
      "tab_zr":"真人",
      "tab_ty":"体育",
      "tab_by":"捕鱼",
      "tab_dz":"电子",
      "card_ptf":"普通房",
      "card_gjf":"高级房",
      "card_gbf":"贵宾房",
      "dangqianzaixian":"当前在线%s人|奖金池%s",
      "peilvshuoming":"赔率说明",
      "wanfaguizhe":"玩法规则",
      "youxishuyu":"游戏术语",
      "xiazhujiqiao":"下注技巧",
      "wanfaguizhe_jieshao":"给大家介绍下玩法规则,为了游…",
      "youxishuyu_jieshao":"了解常用的术语后提高游戏效…",
      "xiazhujiqiao_jieshao":"以下是一些下注的技巧,例如…",
      "haoyuan":"号源",
      "zhudan":"注单",
      "mipai":"咪牌",
      "qushi":"趋势",
      "dixqi":"第%s期",
      "zongyue":"总余额",
      "touzhu":"投注",
      "bet_da":"小",
      "bet_xiao":"大",
      "bet_dan":"单",
      "bet_shuang":"双",
      "di":"第",
      "qi":"期",
      "zhudan_":"注单：",
      "zongji_":"，总计：",
      "qiehuanfangjian":"切换房间",
      "confirm":"确定",
      "cancel":"取消",
      "tema":"特码",
      "diyiqiu":"第一球",
      "dierqiu":"第二球",
      "disanqiu":"第三球",
      "qingshurujine":"请输入金额",
      "zongji":"总计",
      "end":"结束",
      "xiazhuxiangqing":"下注详情",
      "quanbujilu":"全部记录",
      "xiazhujine":"下注金额",
      "keyingjine":"可赢金额",
      "xiaoji":"小计",
      "xbi":"%s笔",
      "qihao_":"期号:",
      "wallet_cny":"CNY钱包",
      "wallet_usdt":"USDT钱包",
      "danhao":"单号",
      "neirong":"内容",
      "guanfanghaoyuan":"官方号源",
      "jianghaozhanshi":"奖号展示",
      "jianghaoshuoming":"奖号说明",
      "gongjujiaoyan":"工具校验",
      "daojishi":"倒计时",
      "qihao":"期号",
      "kaijianghaoma":"开奖号码",
      "haoyuanjinqi":"号源(近50期)",
      "wanzhenghaoyuanzhanshi":"完整号源展示",
      "zhuaqushijian":"抓取时间：%s",
      "shuominghaoyuan":"说明:点击单条号源可以复制哦",
      "bitebipc28quhaojizhi":"比特币PC28取号机制",
      "zhuahaoyuan":"抓号源,获取未确认交易(随机种子)",
      "sha256zhuanhua":"SHA256转化",
      "shijinzhizhuanhua":"10进制转化",
      "shengchengzuihzhonghaoma":"生成最终开奖号码",
      "zhuahaoyuan_jieshao":"复式投注是指所选号码个数超过单式投注的号码个数，所选号码可组合为每一种单式投注方式的多注彩票的投注。胆拖投注指先选取少于单式投注号码个数的号码作为每注都有的胆码，再选取除胆码以外的号码作为拖码，胆码与拖码个数之和必须多于单式投注号码个数，由胆码与拖码的每一种组合按单式投注方式组成多注彩票的投注。",
      "sha256zhuanhua_jieshao":"通过步骤一获取的随机种了是由某一时间点所有交易信息的汇总，即是一个包含N个64位16进制数字的组合。《假设X是发生在某一时间点的交易总量)通过字符串合操作将这些数字合并后，我们可以得到一个长度为64位的16进制数字，计作Y.通过SHA256算法对Y进行转化，可以将其转化为新的64位哈希值Z，并用来进行下一步骤的数学运算。",
      "shijinzhizhuanhua_jieshao":"在步骤二获取Z之后，取其前16位，我们通过10进制转化公式可以得到一个0 - 2^64范围的数字A，用于生成最终开奖号码。",
      "shengchengzuihzhonghaoma_jieshao":"通过步骤三得到A之后，将它除以2^64，取结果的小数点后前3位数，即为开奖号码。",
      "shuruduiyinghaoyuan":"输入对应号源",
      "jiaoyan":"校验",
      "jiaoyanjieguo":"校验结果",
      "sha256zhuanhuahzi":"SHA256转化值",
      "quqianshiliuwei":"取前16位数字",
      "shijinweizhuanhuan":"10进位转换",
      "chuyierde64cifang":"除以二的64次方",
      "zuizhongkaijianghaoma":"最终开奖号码",
      "shuoming":"说明",
      "shuoming_jieshao":"用户可通过相关在线SHA256函数查询网站,复述上述全部哈希值字符串,进行查询,下方提供查询网址:",
      "haoyuanchaxun":"号源查询",
      "dianjifuzhi":"点击复制",
      "jiaoyanshuoming":"校验说明",
      "jiaoyanshuoming1":"1.开奖时,抓取最新时间段内交易的哈希值集合,将其平成长字符串",
      "jiaoyanshuoming2":"2.将上述字符串进行SHA256转化",
      "jiaoyanshuoming3":"3.通过数学公式进行转换,转换规则如下:",
      "jiaoyanshuoming4":"4.根据转换结果,选取小数后3位作为开奖号码",
      "dixqitouzhu":"第%s期，投注: %s",
      "dixqikaijiang":"第%s期，开奖: %s",
      "fengpanzhong":"封盘中",
      "shuaxin":"刷新",
      "kaijiangjieguo":"开奖结果",
      "shujufenxi":"数据分析",
      "shuangmianchanglong":"双面长龙",
      "danshuangluzhu":"单双露珠",
      "daxiaoluzhu":"大小露珠",
      "haomazhoushi":"号码走势",
      "lx_tongji":"%s 统计",
      "xianshiqishu_":"显示期数：%s",
      "zhi":"值",
      "jixiao":"极小",
      "jida":"极大",
      "dalu":"大路",
      "zhupanlu":"珠盘路",
      "hao_value":"号{value}",
      "qingshuruyouximingcheng":"请输入游戏名称",
      "xuanzhe":"选择",
      "quanbuyouxi":"全部游戏",
      "shoucangla":"收藏啦",
      "qiandaoyouli":"签到有礼",
      "jifen":"积分",
      "benyueyiqian":"本月已签到%s次",
      "zongjifen_":"总积分%s",
      "lijiqiandao":"立即签到",
      "day_yi":"一",
      "day_er":"二",
      "day_san":"三",
      "day_si":"四",
      "day_wu":"五",
      "day_liu":"六",
      "day_ri":"日",
      "jifenyaojiang":"积分摇奖",
      "jifenmeici":"积分：%s(5积分每次)",
      "lianyao5":"连摇5次",
      "lianyao10":"连摇10次",
      "lianyao15":"连摇15次",
      "lianyao20":"连摇20次",
      "huodongguizhe":"活动规则",
      "jiangjintiqu":"奖金提取",
      "nianyueri":"yyyy年MM月dd日",
      "bencijiangli":"本次奖励",
      "gongxiwancheng":"恭喜你完成任务",
      "xiaciqiandao":"下次签到奖励%s,可获得%s积分",
      "mingtianjixue":"明天继续",
      "gongxininhuode":"恭喜您获得",
      "jiangjin":"奖金",
      "cishu":"次数",




    },
  };


}

