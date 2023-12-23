
import 'dart:ui';

import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';

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

  ///当前语言环境
  Locale currentLocale(){
    return locales[AppData.localeIndex()];
  }

  ///当前语言环境
  Locale fallbackLocale(){
    return locales[1];
  }

  String get theme => 'theme'.tr;
  String get home => 'home'.tr;
  String get mine => 'mine'.tr;
  String get preferential => 'preferential'.tr;
  String get customer_service => 'customer_service'.tr;
  String get charge => 'charge'.tr;
  String get tixian => 'tixian'.tr;
  String get choujiang => 'choujiang'.tr;
  String get zoushi => 'zoushi'.tr;
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
  String get yue_ => 'yue_'.tr;
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
  String dangqianzaixian(List<String> args) => 'dangqianzaixian'.trArgs(args);
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
  String dixqi(List<String> args) => 'dixqi'.trArgs(args);
  String juelidixqi(List<String> args) => 'juelidixqi'.trArgs(args);

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
  String xbi(List<String> args) => 'xbi'.trArgs(args);
  String qihao_(List<String> args) => 'qihao_'.trArgs(args);
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
  String zhuaqushijian(List<String> args) => 'zhuaqushijian'.trArgs(args);
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
  String dixqitouzhu(List<String> args) => 'dixqitouzhu'.trArgs(args);
  String dixqikaijiang(List<String> args) => 'dixqikaijiang'.trArgs(args);
  String get fengpanzhong => 'fengpanzhong'.tr;
  String get shuaxin => 'shuaxin'.tr;
  String get kaijiangjieguo => 'kaijiangjieguo'.tr;
  String get shujufenxi => 'shujufenxi'.tr;
  String get shuangmianchanglong => 'shuangmianchanglong'.tr;
  String get danshuangluzhu => 'danshuangluzhu'.tr;
  String get daxiaoluzhu => 'daxiaoluzhu'.tr;
  String get haomazhoushi => 'haomazhoushi'.tr;
  String lx_tongji(List<String> args) => 'lx_tongji'.trArgs(args);
  String xianshiqishu_(List<String> args) => 'xianshiqishu_'.trArgs(args);
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
  String benyueyiqian(List<String> args) => 'benyueyiqian'.trArgs(args);
  String zongjifen_(List<String> args) => 'zongjifen_'.trArgs(args);
  String get lijiqiandao => 'lijiqiandao'.tr;
  String get day_yi => 'day_yi'.tr;
  String get day_er => 'day_er'.tr;
  String get day_san => 'day_san'.tr;
  String get day_si => 'day_si'.tr;
  String get day_wu => 'day_wu'.tr;
  String get day_liu => 'day_liu'.tr;
  String get day_ri => 'day_ri'.tr;
  String get jifenyaojiang => 'jifenyaojiang'.tr;
  String jifenmeici(List<String> args) => 'jifenmeici'.trArgs(args);
  String get lianyao5 => 'lianyao5'.tr;
  String get lianyao10 => 'lianyao10'.tr;
  String get lianyao15 => 'lianyao15'.tr;
  String get lianyao20 => 'lianyao20'.tr;
  String get huodongguizhe => 'huodongguizhe'.tr;
  String get jiangjintiqu => 'jiangjintiqu'.tr;
  String get nianyueri => 'nianyueri'.tr;
  String get bencijiangli => 'bencijiangli'.tr;
  String get gongxiwancheng => 'gongxiwancheng'.tr;
  String xiaciqiandao(List<String> args) => 'xiaciqiandao'.trArgs(args);
  String get mingtianjixue => 'mingtianjixue'.tr;
  String get gongxininhuode => 'gongxininhuode'.tr;
  String get jiangjin => 'jiangjin'.tr;
  String get cishu => 'cishu'.tr;
  String get lishikaijiang => 'lishikaijiang'.tr;
  String get kaijiangzhoushi => 'kaijiangzhoushi'.tr;
  String get qugoucai => 'qugoucai'.tr;
  String get goucai => 'goucai'.tr;
  String get xiaoxi => 'xiaoxi'.tr;
  String get gonggao => 'gonggao'.tr;
  String get gonggaoxiangqing => 'gonggaoxiangqing'.tr;
  String get youhuizhongxin => 'youhuizhongxin'.tr;
  String get chongzhi => 'chongzhi'.tr;
  String get quanbu => 'quanbu'.tr;
  String get qita => 'qita'.tr;
  String get fanhui => 'fanhui'.tr;
  String get wenxintishi_fuzhi => 'wenxintishi_fuzhi'.tr;
  String get chongzhizhongxin => 'chongzhizhongxin'.tr;
  String chongzhizhanghu_(List<String> args) => 'chongzhizhanghu_'.trArgs(args);
  String dangqianmoren(List<String> args) => 'dangqianmoren'.trArgs(args);
  String get xianshang => 'xianshang'.tr;
  String get xianxia => 'xianxia'.tr;
  String get diyibu_chakanshoukuanxinxi => 'diyibu_chakanshoukuanxinxi'.tr;
  String get wenxintishi_zhifuyoushijian => 'wenxintishi_zhifuyoushijian'.tr;
  String get dierbu_tianchongdingdan => 'dierbu_tianchongdingdan'.tr;
  String get chongzhizhanghu => 'chongzhizhanghu'.tr;
  String get huikuanxingming => 'huikuanxingming'.tr;
  String get huikuanjine => 'huikuanjine'.tr;
  String get qingshuruhuikuanren => 'qingshuruhuikuanren'.tr;
  String get qingshuruhuikuanjine => 'qingshuruhuikuanjine'.tr;
  String get tijiao => 'tijiao'.tr;
  String get bibiduihuan => 'bibiduihuan'.tr;
  String get eduzhuanhuan => 'eduzhuanhuan'.tr;
  String get zhifushuoming_rmb => 'zhifushuoming_rmb'.tr;
  String get kahao => 'kahao'.tr;
  String get cikaren => 'cikaren'.tr;
  String get beizhu => 'beizhu'.tr;
  String get dianjixiafangzhifu => 'dianjixiafangzhifu'.tr;
  String get wenxintishi_ => 'wenxintishi_'.tr;
  String get wenxintishi_1 => 'wenxintishi_1'.tr;
  String wenxintishi_2(List<String> args) => 'wenxintishi_2'.trArgs(args);
  String wenxintishi_3(List<String> args) => 'wenxintishi_3'.trArgs(args);
  String get tianrujine => 'tianrujine'.tr;
  String get shoudongshuruhuoxuanzhe => 'shoudongshuruhuoxuanzhe'.tr;
  String get diyibu_xuanzhezhifuxieyi => 'diyibu_xuanzhezhifuxieyi'.tr;
  String get dierbu_chakanshoukuanxinxi => 'dierbu_chakanshoukuanxinxi'.tr;
  String get shoukuanzhanghu => 'shoukuanzhanghu'.tr;
  String get disanbu_tianxierukuanxinxi => 'disanbu_tianxierukuanxinxi'.tr;
  String get fanhuishouye => 'fanhuishouye'.tr;
  String get zhifushuoming_ => 'zhifushuoming_'.tr;
  String get zhifushuoming_1 => 'zhifushuoming_1'.tr;
  String get zhifushuoming_2 => 'zhifushuoming_2'.tr;
  String nicheng_(List<String> args) => 'nicheng_'.trArgs(args);
  String get wodeqianbao => 'wodeqianbao'.tr;
  String get tixianmima => 'tixianmima'.tr;
  String get zijinmingxi => 'zijinmingxi'.tr;
  String get bangdingyinhangka => 'bangdingyinhangka'.tr;
  String get bangdingusdt => 'bangdingusdt'.tr;
  String get wodetouzhu => 'wodetouzhu'.tr;
  String get touzhujilu => 'touzhujilu'.tr;
  String get jifenjilu => 'jifenjilu'.tr;
  String get huiyuanfanshui => 'huiyuanfanshui'.tr;
  String get hongbaohejiangjin => 'hongbaohejiangjin'.tr;
  String get wodeyinli => 'wodeyinli'.tr;
  String get tuiguangzhuanqian => 'tuiguangzhuanqian'.tr;
  String get dializhuce => 'dializhuce'.tr;
  String get tongyongshezhi => 'tongyongshezhi'.tr;
  String get bangzhuzhongxin => 'bangzhuzhongxin'.tr;
  String get guanyuwomen => 'guanyuwomen'.tr;
  String tixianzhanghu_(List<String> args) => 'tixianzhanghu_'.trArgs(args);
  String get congcnyqianbaotichu => 'congcnyqianbaotichu'.tr;
  String get congusdtqianbaotichu => 'congusdtqianbaotichu'.tr;
  String get tixianxinxi => 'tixianxinxi'.tr;
  String get querentixianxinxi => 'querentixianxinxi'.tr;
  String get tixianjine => 'tixianjine'.tr;
  String get qingshurutixianmima => 'qingshurutixianmima'.tr;
  String get qingshurutixianjine => 'qingshurutixianjine'.tr;
  String get querenjine => 'querenjine'.tr;
  String get shouxufei => 'shouxufei'.tr;
  String get kedaozhangjine => 'kedaozhangjine'.tr;
  String get qingxuanzhetixianzhanghu => 'qingxuanzhetixianzhanghu'.tr;
  String get querenjihexinxi => 'querenjihexinxi'.tr;
  String zitixianhouzongtouzhu_(List<String> args) => 'zitixianhouzongtouzhu_'.trArgs(args);
  String meiyoutongguoyouhui_(List<String> args) => 'meiyoutongguoyouhui'.trArgs(args);
  String get tongguoyouhuijihe => 'tongguoyouhuijihe'.tr;
  String get changtaixingjihe => 'changtaixingjihe'.tr;
  String get tongguochangtaixing => 'tongguochangtaixing'.tr;
  String meiyoutongguochangtaixing_(List<String> args) => 'meiyoutongguochangtaixing'.trArgs(args);
  String get duocitixian => 'duocitixian'.tr;
  String yixiaoshineimian_(List<String> args) => 'yixiaoshineimian'.trArgs(args);
  String xukouchushouxufei_(List<String> args) => 'xukouchushouxufei'.trArgs(args);
  String get shixiaoshouxufei => 'shixiaoshouxufei'.tr;
  String get mianshoushouxufei => 'mianshoushouxufei'.tr;
  String get cichijiheshijian => 'cichijiheshijian'.tr;
  String meidongshijian_(List<String> args) => 'meidongshijian_'.trArgs(args);
  String get jixutixian => 'jixutixian'.tr;
  String get tijiaochenggong => 'tijiaochenggong'.tr;
  String get tixianxiangqing => 'tixianxiangqing'.tr;
  String get tijiaoshijian => 'tijiaoshijian'.tr;
  String shouxufei_(List<String> args) => 'shouxufei_'.trArgs(args);
  String get daozhangjine => 'daozhangjine'.tr;
  String get zhanghuyue => 'zhanghuyue'.tr;
  String get wancheng => 'wancheng'.tr;
  String get shezhi => 'shezhi'.tr;
  String get gerenziliao => 'gerenziliao'.tr;
  String get shezhidenglumima => 'shezhidenglumima'.tr;
  String get shezhijianyimima => 'shezhijianyimima'.tr;
  String get zhongwen => 'zhongwen'.tr;
  String get quankai => 'quankai'.tr;
  String get tuichudenglu => 'tuichudenglu'.tr;
  String get wanshanziliao => 'wanshanziliao'.tr;
  String get nicheng => 'nicheng'.tr;
  String get shoujihaoma => 'shoujihaoma'.tr;
  String get qqhaoma => 'qqhaoma'.tr;
  String get weixin => 'weixin'.tr;
  String get shuruweixinhao => 'shuruweixinhao'.tr;
  String get shuruqqhaoma => 'shuruqqhaoma'.tr;
  String get shuruzhenshiyouxiao => 'shuruzhenshiyouxiao'.tr;
  String get shurudianziyouxiang => 'shurudianziyouxiang'.tr;
  String get shurunicheng => 'shurunicheng'.tr;
  String get shezhitixianmima => 'shezhitixianmima'.tr;
  String get yuanmima => 'yuanmima'.tr;
  String get shuruyuantixianmima => 'shuruyuantixianmima'.tr;
  String get xinmima => 'xinmima'.tr;
  String get shuruxintixianmima => 'shuruxintixianmima'.tr;
  String get zaiciqueren => 'zaiciqueren'.tr;
  String get chongfushuru => 'chongfushuru'.tr;
  String get querenjianyimima => 'querenjianyimima'.tr;
  String get shurujianyimima => 'shurujianyimima'.tr;
  String get shezhichenggong => 'shezhichenggong'.tr;
  String get shuruneirongbuyizhi => 'shuruneirongbuyizhi'.tr;
  String get wenxintishi_jianyimima => 'wenxintishi_jianyimima'.tr;
  String get shuruyuandenglumima => 'shuruyuandenglumima'.tr;
  String get shuruxindenglumima => 'shuruxindenglumima'.tr;
  String get chongfushuruxindenglumima => 'chongfushuruxindenglumima'.tr;
  String get tixianzhongxin => 'tixianzhongxin'.tr;
  String get youhuijihe => 'youhuijihe'.tr;
  String get tixianzhanghu => 'tixianzhanghu'.tr;
  String get genghuantouxiang => 'genghuantouxiang'.tr;
  String get moren => 'moren'.tr;
  String get qq => 'qq'.tr;
  String get jingxuan => 'jingxuan'.tr;
  String get gezhanghumingxi => 'gezhanghumingxi'.tr;
  String get huazhuanjilu => 'huazhuanjilu'.tr;
  String get dailizhuce => 'dailizhuce'.tr;
  String get querenmima => 'querenmima'.tr;
  String get dianziyouxiang => 'dianziyouxiang'.tr;
  String get wenxintishi_zhuce => 'wenxintishi_zhuce'.tr;
  String get jieshaorenxinxi => 'jieshaorenxinxi'.tr;
  String get daima => 'daima'.tr;
  String get fuzhi => 'fuzhi'.tr;
  String get lianjie => 'lianjie'.tr;
  String get tuiguangerweima => 'tuiguangerweima'.tr;
  String get baocuntupian => 'baocuntupian'.tr;
  String get fuzhilianjie => 'fuzhilianjie'.tr;
  String get huiyuanliebiao => 'huiyuanliebiao'.tr;
  String get riqi => 'riqi'.tr;
  String get xiaxiancunkuan => 'xiaxiancunkuan'.tr;
  String get zhuanquhongli => 'zhuanquhongli'.tr;
  String get xianxiayonghu => 'xianxiayonghu'.tr;
  String get zhu_beijingshijian => 'zhu_beijingshijian'.tr;
  String get riqi_meidong => 'riqi_meidong'.tr;
  String get jiaoyileibie => 'jiaoyileibie'.tr;
  String get jiaoyiedu => 'jiaoyiedu'.tr;
  String get xianyouedu => 'xianyouedu'.tr;
  String get xiazhujifenjiangli => 'xiazhu_jifenjiangli'.tr;
  String get fuyinglifanshui => 'fuyinglifanshui'.tr;
  String get youxileixing => 'youxileixing'.tr;
  String get youxiaotouzhu => 'youxiaotouzhu'.tr;
  String get shuying => 'shuying'.tr;
  String get fanshui => 'fanshui'.tr;
  String get touzhuliangfanshui => 'touzhuliangfanshui'.tr;
  String get jinrizuhezhanbilv => 'jinrizuhezhanbilv'.tr;
  String qitayouxi_(List<String> args) => 'qitayouxi_'.trArgs(args);
  String get huishui => 'huishui'.tr;
  String get yinlifanshui => 'yinlifanshui'.tr;
  String get zuhezhanbilv => 'zuhezhanbilv'.tr;
  String get jinri => 'jinri'.tr;
  String get day_7 => 'day_7'.tr;
  String get day_15 => 'day_15'.tr;
  String get day_30 => 'day_30'.tr;
  String get youxipingtai => 'youxipingtai'.tr;
  String get bishu => 'bishu'.tr;
  String get touzhue => 'touzhue'.tr;
  String youxiaotouzhu_(List<String> args) => 'youxiaotouzhu_'.trArgs(args);
  String get touzhuriqi => 'touzhuriqi'.tr;
  String wodeyinhangka_(List<String> args) => 'wodeyinhangka_'.trArgs(args);
  String wodeshuzhiqianbao_(List<String> args) => 'wodeshuzhiqianbao_'.trArgs(args);
  String get tianjiayinhangka => 'tianjiayinhangka'.tr;
  String get wenxintixing_yinhangka => 'wenxintixing_yinhangka'.tr;
  String get tianjiashuziqianbao => 'tianjiashuziqianbao'.tr;
  String get wenxintixing_usdt => 'wenxintixing_usdt'.tr;
  String get dizhi => 'dizhi'.tr;
  String get suoshuxieyi => 'suoshuxieyi'.tr;
  String zuiduoketianjia_(List<String> args) => 'zuiduoketianjia_'.trArgs(args);
  String get hongbao => 'hongbao'.tr;
  String get jine => 'jine'.tr;
  String get youxiaoqi => 'youxiaoqi'.tr;
  String get xuyaodamaliang => 'xuyaodamaliang'.tr;
  String get yitiqu => 'yitiqu'.tr;
  String get weijihuo => 'weijihuo'.tr;
  String get yijihuo => 'yijihuo'.tr;
  String get yishixiao => 'yishixiao'.tr;
  String get tiqu => 'tiqu'.tr;
  String get tiquchenggong => 'tiquchenggong'.tr;
  String get duihuan => 'duihuan'.tr;
  String huilv_(List<String> args) => 'huilv_'.trArgs(args);
  String get cong_from => 'cong_from'.tr;
  String get zhi_to => 'zhi_to'.tr;
  String get zhuanru => 'zhuanru'.tr;
  String get huazhuanjine => 'huazhuanjine'.tr;
  String get querenhuazhuan => 'querenhuazhuan'.tr;
  String get yijianguiji => 'yijianguiji'.tr;
  String get xuanzheriqi => 'xuanzheriqi'.tr;
  String get shaixuan => 'shaixuan'.tr;
  String get cunqukuan => 'cunqukuan'.tr;
  String get zhuanzhang => 'zhuanzhang'.tr;
  String get zhichu => 'zhichu'.tr;
  String get shouru => 'shouru'.tr;
  String get qingxuanzhe => 'qingxuanzhe'.tr;
  String get qing3fenzhonghoushuaxin => 'qing3fenzhonghoushuaxin'.tr;
  String get chongzhixiangqing => 'chongzhixiangqing'.tr;
  String get dingdanbianhao => 'dingdanbianhao'.tr;
  String get chongzhijine => 'chongzhijine'.tr;
  String get chongzhixingming => 'chongzhixingming'.tr;
  String get zhongwenjianti => 'zhongwenjianti'.tr;
  String get yingyu => 'yingyu'.tr;
  String get yuenanyu => 'yuenanyu'.tr;
  String get jintian => 'jintian'.tr;
  String get zuijin7tain => 'zuijin7tain'.tr;
  String get zuijin30tian => 'zuijin30tian'.tr;
  String get quanbuzhuangtai => 'quanbuzhuangtai'.tr;
  String get chenggong => 'chenggong'.tr;
  String get chulizhong => 'chulizhong'.tr;
  String get yiquxiao => 'yiquxiao'.tr;
  String get quanbufangshi => 'quanbufangshi'.tr;
  String get changyongduanyu => 'changyongduanyu'.tr;
  String get qitaduanyu => 'qitaduanyu'.tr;
  String get biaoqing => 'biaoqing'.tr;
  String get gif => 'gif'.tr;
  String get shifoutuichudenglu => 'shifoutuichudenglu'.tr;
  String get fuzhichenggong => 'fuzhichenggong'.tr;
  String get qiehuanquanjuqianbao => 'qiehuanquanjuqianbao'.tr;
  String get tuijianyouli => 'tuijianyouli'.tr;
  String get zanwuyouxi => 'zanwuyouxi'.tr;
  String get fangwenluxian => 'fangwenluxian'.tr;
  String get kuai => 'kuai'.tr;
  String get yiban => 'yiban'.tr;
  String get henman => 'henman'.tr;
  String get bukeyong => 'bukeyong'.tr;
  String get fanshuishuoming => 'fanshuishuoming'.tr;
  String get jiazaizhong => 'jiazaizhong'.tr;
  String get weikaishi => 'weikaishi'.tr;
  String get jinxingzhong => 'jinxingzhong'.tr;
  String get yijieshu => 'yijieshu'.tr;
  String get hongbaohuodong => 'hongbaohuodong'.tr;
  String get xiangqing => 'xiangqing'.tr;
  String get qingxiandenglu => 'qingxiandenglu'.tr;
  String get jingqingqidai => 'jingqingqidai'.tr;
  String get denglugengjingcai => 'denglugengjingcai'.tr;
  String get gengduo => 'gengduo'.tr;
  String get huishou => 'huishou'.tr;
  String get sishiershuzihuozimu => 'sishiershuzihuozimu'.tr;
  String get bashiershuzihuozimu => 'bashiershuzihuozimu'.tr;
  String get zhenshixingmingbunengkong => 'huishou'.tr;
  String get yanzhengmabunengkong => 'yanzhengmabunengkong'.tr;
  String get mimashurubuyizhi => 'mimashurubuyizhi'.tr;
  String get usdt_coin => 'usdt_coin'.tr;
  String get lianxizaixiankefu => 'lianxizaixiankefu'.tr;
  String get shuruzhuanzhangqianbao => 'shuruzhuanzhangqianbao'.tr;
  String get yiwanchengtijiaorukuan => 'yiwanchengtijiaorukuan'.tr;
  String get qianbaodizhi => 'qianbaodizhi'.tr;
  String get shifoujinxingzhuanzhang => 'shifoujinxingzhuanzhang'.tr;
  String get tishi => 'tishi'.tr;
  String get yinhangmingcheng => 'yinhangmingcheng'.tr;
  String get xuanzhezhifuyinhang => 'xuanzhezhifuyinhang'.tr;
  String zhifutiaozhuan_(List<String> args) => 'zhifutiaozhuan'.trArgs(args);
  String get quedingtijiaodingdan => 'quedingtijiaodingdan'.tr;
  String get caozuochenggong => 'caozuochenggong'.tr;
  String get zhuzhanghao => 'zhuzhanghao'.tr;
  String get qingxuanzhezhuanru => 'qingxuanzhezhuanru'.tr;
  String get qingxuanzhezhuanchu => 'qingxuanzhezhuanchu'.tr;
  String shixiaokouchu_(List<String> args) => 'shixiaokouchu'.trArgs(args);
  String shixiaomianshou_(List<String> args) => 'shixiaomianshou'.trArgs(args);
  String get qingxuanzhetikuanzhanghu => 'qingxuanzhetikuanzhanghu'.tr;
  String get dianjitianjiazhanghu => 'dianjitianjiazhanghu'.tr;
  String get ninhaimeibangdingyhkzhanghu => 'ninhaimeibangdingyhkzhanghu'.tr;
  String get ninhaimeibangdingusdtzhanghu => 'ninhaimeibangdingusdtzhanghu'.tr;
  String get qubangding => 'qubangding'.tr;
  String get chukuanzhanghu => 'chukuanzhanghu'.tr;
  String get kaihudizhi => 'kaihudizhi'.tr;
  String get yanzhengchukuanmima => 'yanzhengchukuanmima'.tr;
  String get shuruyinhangkakaihudizhi => 'shuruyinhangkakaihudizhi'.tr;
  String get liudao12weishuzihuozimu => 'liudao12weishuzihuozimu'.tr;
  String get yigezhanghaosanzhangyinhangka => 'yigezhanghaosanzhangyinhangka'.tr;
  String get qingshuruqukuanmima => 'qingshuruqukuanmima'.tr;
  String get qianbaoxieyi => 'qianbaoxieyi'.tr;
  String get yanzhengzijinmima => 'yanzhengzijinmima'.tr;
  String get qingshuruqianbaodizhi => 'qingshuruqianbaodizhi'.tr;
  String get chukuanyinhang => 'chukuanyinhang'.tr;
  String get shuruyinhangzhanghao => 'shuruyinhangzhanghao'.tr;
  String get qingxuanzhechukuanyinhang => 'qingxuanzhechukuanyinhang'.tr;
  String get qingshuruchukuanmima => 'qingshuruchukuanmima'.tr;
  String get trc20_show => 'trc20_show'.tr;
  String get erc20_show => 'erc20_show'.tr;
  String get omni_show => 'omni_show'.tr;
  String get tuiguanghongli => 'tuiguanghongli'.tr;
  String get sidao12shuzihuozimu => 'sidao12shuzihuozimu'.tr;
  String get mimacuowu => 'mimacuowu'.tr;
  String get zhanghaomimadenglu => 'zhanghaomimadenglu'.tr;
  String get chongzhijymm => 'chongzhijymm'.tr;
  String get chongzhijymmtishi => 'chongzhijymmtishi'.tr;
  String get qingzaiciyanzhenghaxizhi => 'qingzaiciyanzhenghaxizhi'.tr;
  String get baocunchenggong => 'baocunchenggong'.tr;
  String get geshangqi => 'geshangqi'.tr;
  String get jinrikai => 'jinrikai'.tr;
  String get wodeshoucang => 'wodeshoucang'.tr;
  String get lianxiwomen => 'lianxiwomen'.tr;
  String get guojizhan2023 => '2023guojizhan'.tr;







  @override
  Map<String, Map<String, String>> get keys => {
    'zh_ZH': {
      "home": "首页",
      "mine": "我的",
      "preferential": "优惠",
      "charge": "充值",
      "tixian": "提现",
      "choujiang": "抽奖",
      "zoushi": "走势",
      "customer_service": "客服",
      "theme": "主题",
      "pick_time": "选择时间",
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
      "yue_":"余额：",
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
      "qsrzcyzm":"请输入右侧验证码",
      "wywdbty":"注册即代表您已同意",
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
      "dangqianzaixian":"%s|%s",
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
      "juelidixqi":"距离第%s期",
      "zongyue":"总余额",
      "touzhu":"投注",
      "bet_da":"大",
      "bet_xiao":"小",
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
      "qihao_":"期号:%s",
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
      "lishikaijiang":"历史开奖",
      "kaijiangzhoushi":"开奖走势",
      "qugoucai":"去购彩",
      "goucai":"购彩",
      "xiaoxi":"消息",
      "gonggao":"公告",
      "gonggaoxiangqing":"公告详情",
      "youhuizhongxin":"优惠中心",
      "chongzhi":"充值",
      "quanbu":"全部",
      "qita":"其他",
      "fanhui":"返回",
      "wenxintishi_fuzhi":"温馨提示：\n长按号码可以复制到剪切板",
      "chongzhizhongxin":"充值中心",
      "chongzhizhanghu_":"充值帐户: %s",
      "dangqianmoren":"%s(当前默认)",
      "xianshang":"线上(自动到账)",
      "xianxia":"线下(人工存款)",
      "diyibu_chakanshoukuanxinxi":"第一步,查看下方收款信息,去转帐充值:",
      "wenxintishi_zhifuyoushijian":"温馨提示: 支付有时间限制,请在规定的时间内完成转帐操作",
      "dierbu_tianchongdingdan":"第二步,填充订单(充值时的汇款资料)",
      "chongzhizhanghu":"充值账户",
      "huikuanxingming":"汇款姓名",
      "huikuanjine":"汇款金额",
      "qingshuruhuikuanren":"请输入汇款人姓名",
      "qingshuruhuikuanjine":"请输入汇款金额",
      "tijiao":"提交",
      "bibiduihuan":"币币兑换",
      "eduzhuanhuan":"额度转换",
      "zhifushuoming_rmb":"支付说明:\n1.公司帐户资金如何领取到个人帐户 人民币银行结算账户管理方法规定\n2.公司帐户资金如何领取到个人帐户 人民币银行结算账户管理方法规定",
      "kahao":"卡号",
      "cikaren":"持卡人",
      "beizhu":"备注",
      "dianjixiafangzhifu":"点击下方支付跳转链接并阅读提示信息",
      "wenxintishi_":"温馨提示:",
      "wenxintishi_1":"1、系统将会自动打开一个网页，请按提示继续操作",
      "wenxintishi_2":"2、手续费 %s%,到账率高!",
      "wenxintishi_3":"3、%s",
      "tianrujine":"填入金额(1-0)并点击确定",
      "shoudongshuruhuoxuanzhe":"手动输入或下方选择金额",
      "diyibu_xuanzhezhifuxieyi":"第一步,选择支付协议",
      "dierbu_chakanshoukuanxinxi":"第二步,查看收款信息,进行转账充值",
      "shoukuanzhanghu":"收款账户",
      "disanbu_tianxierukuanxinxi":"第三步,完成转账后填写入款信息",
      "fanhuishouye":"返回首页",
      "zhifushuoming_":"支付说明:\n1.",
      "zhifushuoming_1":"充值完毕,系统会在2分钟内自动存入USDT钱包,如果您想使用CNY钱包,请到「币币兑换」页面兑换\n",
      "zhifushuoming_2":"2.公司帐户资金如何领取到个人帐户 人民币银行结算账户管理方法规定",
      "nicheng_":"昵称：%s",
      "wodeqianbao":"我的钱包",
      "tixianmima":"提现密码",
      "zijinmingxi":"资金交易",
      "bangdingyinhangka":"绑定银行卡",
      "bangdingusdt":"绑定USDT",
      "wodetouzhu":"我的投注",
      "touzhujilu":"投注记录",
      "jifenjilu":"积分记录",
      "huiyuanfanshui":"会员返水",
      "hongbaohejiangjin":"红包和奖金",
      "wodeyinli":"我的盈利",
      "tuiguangzhuanqian":"推广赚钱",
      "dializhuce":"代理注册",
      "tongyongshezhi":"通用设置",
      "bangzhuzhongxin":"帮助中心",
      "guanyuwomen":"关于我们",
      "tixianzhongxin":"提现中心",
      "tixianzhanghu_":"提现帐户: %s",
      "congcnyqianbaotichu":"从CNY钱包提出",
      "congusdtqianbaotichu":"从USDT钱包提出",
      "tixianxinxi":"提现信息",
      "querentixianxinxi":"确认提现信息",
      "tixianjine":"提现金额",
      "qingshurutixianmima":"请输入提现密码",
      "qingshurutixianjine":"请输入提现金额",
      "querenjine":"确认金额",
      "shouxufei":"手续费",
      "kedaozhangjine":"可到账金额",
      "qingxuanzhetixianzhanghu":"请选择提现账户",
      "querenjihexinxi":"确认稽核信息",
      "zitixianhouzongtouzhu_":"自提现后第一次存款之后总有效投注: %s",
      "youhuijihe":"优惠稽核",
      "meiyoutongguoyouhui":"没有通过优惠稽核，需扣除优惠%s",
      "tongguoyouhuijihe":"通过优惠稽核，不需扣除存款优惠",
      "changtaixingjihe":"常态性稽核",
      "tongguochangtaixing":"通过常态性稽核，不收取行政费用!",
      "meiyoutongguochangtaixing":"没有通过常态性稽核，需扣除行政费用%s",
      "duocitixian":"多次提现手续费",
      "yixiaoshineimian":"%s小时内%s次提现，%s",
      "xukouchushouxufei":"需扣除手续费%s",
      "shixiaoshouxufei":"时效手续费",
      "mianshoushouxufei":"免收手续费!",
      "shixiaokouchu":"距最近一次存款%s小时内出款，将扣除出款金额%s的手续费",
      "shixiaomianshou":"距最近一次存款%s小时内出款，免收手续费!",
      "cichijiheshijian":"此次稽核时间",
      "meidongshijian_":"美东时间:%s",
      "jixutixian":"继续提现",
      "tijiaochenggong":"提交成功",
      "tixianxiangqing":"提现详情",
      "tixianzhanghu":"提现账户",
      "tijiaoshijian":"提交时间",
      "shouxufei_":"(手续费:%s)",
      "daozhangjine":"到账金额",
      "zhanghuyue":"账户余额",
      "wancheng":"完成",
      "shezhi":"设置",
      "gerenziliao":"个人资料",
      "shezhidenglumima":"设置登录密码",
      "shezhijianyimima":"设置简易密码",
      "zhongwen":"中文",
      "quankai":"全开",
      "tuichudenglu":"退出登录",
      "wanshanziliao":"完善资料",
      "nicheng":"昵称",
      "shoujihaoma":"手机号码",
      "qqhaoma":"QQ号码",
      "weixin":"微信",
      "shuruweixinhao":"请输入微信号",
      "shuruqqhaoma":"请输入QQ号码",
      "shuruzhenshiyouxiao":"请输入真实有效的手机号码",
      "shurudianziyouxiang":"请输入电子邮箱",
      "shurunicheng":"输入昵称",
      "shezhitixianmima":"设置提现密码",
      "yuanmima":"原密码",
      "shuruyuantixianmima":"输入原提现密码",
      "xinmima":"新密码",
      "shuruxintixianmima":"输入6-12位新提现密码",
      "zaiciqueren":"再次确认",
      "chongfushuru":"重复输入新提现密码",
      "querenjianyimima":"确认简易密码",
      "shurujianyimima":"输入简易密码",
      "shezhichenggong":"设置成功",
      "shuruneirongbuyizhi":"输入内容不一致，请重试",
      "wenxintishi_jianyimima":"温馨提示:\n一些说明文字一些说明文字一些说明文字一些说明文字一些说明文字",
      "shuruyuandenglumima":"输入原登录密码",
      "shuruxindenglumima":"输入8-12位新登录密码",
      "chongfushuruxindenglumima":"重复输入新登录密码",
      "genghuantouxiang":"更换头像",
      "moren":"默认",
      "qq":"QQ",
      "jingxuan":"精选",
      "gezhanghumingxi":"各账户额度明细",
      "huazhuanjilu":"划转记录",
      "dailizhuce":"代理注册",
      "querenmima":"确认密码",
      "dianziyouxiang":"电子邮箱",
      "wenxintishi_zhuce":"温馨提示:\n1.标有*号代表必须填写项目\n2.注册即代表您已同意各项“开户协议”",
      "jieshaorenxinxi":"介绍人信息",
      "daima":"代码",
      "fuzhi":"复制",
      "lianjie":"链接",
      "tuiguangerweima":"推广二维码",
      "baocuntupian":"保存图片",
      "baocunchenggong":"保存成功",
      "fuzhilianjie":"复制链接",
      "huiyuanliebiao":"会员列表",
      "riqi":"日期",
      "xiaxiancunkuan":"下线存款",
      "zhuanquhongli":"赚取红利",
      "xianxiayonghu":"线下用户",
      "zhu_beijingshijian":"注:北京时间 = 美东时间 + 12小时",
      "riqi_meidong":"日期 (美东)",
      "jiaoyileibie":"交易类别",
      "jiaoyiedu":"交易额度",
      "xianyouedu":"现有额度",
      "xiazhujifenjiangli":"下注积分奖励",
      "fuyinglifanshui":"负盈利返水",
      "youxileixing":"游戏类型",
      "youxiaotouzhu":"有效投注",
      "shuying":"输赢",
      "fanshui":"返水",
      "touzhuliangfanshui":"投注量返水",
      "jinrizuhezhanbilv":"今日投注组合占比率",
      "qitayouxi_":"其他游戏 ( %s 至 %s )",
      "huishui":"回水",
      "yinlifanshui":"盈利返水",
      "zuhezhanbilv":"组合占比率",
      "jinri":"今日",
      "day_7":"近7日",
      "day_15":"近15日",
      "day_30":"近30日",
      "youxipingtai":"游戏平台",
      "bishu":"笔数",
      "touzhue":"投注额",
      "youxiaotouzhu_":"有效投注: %s 投注额: %s",
      "touzhuriqi":"投注日期 (东美时间)",
      "wodeyinhangka_":"我的银行卡:已绑定%s张 (还可以绑定%s张)",
      "wodeshuzhiqianbao_":"我的数字钱包:已绑定%s张 (还可以绑定%s张)",
      "tianjiayinhangka":"添加银行卡",
      "zuiduoketianjia_":"(最多可添加%s张)",
      "wenxintixing_yinhangka":"温馨提醒:\n1.银行卡账户持有人姓名必须与注册时输入的姓名一致,否则无法申请提款;\n2.每个用户最多可以绑定 3 张银行卡;\n3.一经绑定不能擅自修改,如需修改请",
      "tianjiashuziqianbao":"添加数字钱包",
      "wenxintixing_usdt":"温馨提醒:\n1.每个用户最多可以绑定 3 个USDT钱包账户(不同协议分别可以绑定一个;\n2.一经绑定不能擅自修改,如需修改请",
      "dizhi":"地址",
      "suoshuxieyi":"所属协议",
      "hongbao":"红包",
      "jine":"金额",
      "youxiaoqi":"有效期",
      "xuyaodamaliang":"需要打码量",
      "yitiqu":"已提取",
      "weijihuo":"未激活",
      "yijihuo":"已激活",
      "yishixiao":"已失效",
      "tiqu":"提取",
      "tiquchenggong":"提取成功",
      "duihuan":"兑换",
      "huilv_":"汇率: %s",
      "cong_from":"从",
      "zhi_to":"至",
      "zhuanru":"转入",
      "huazhuanjine":"划转金额",
      "querenhuazhuan":"确认划转",
      "yijianguiji":"一键归集",
      "xuanzheriqi":"选择日期",
      "shaixuan":"筛选",
      "cunqukuan":"存/提款",
      "zhuanzhang":"转账",
      "zhichu":"支出",
      "shouru":"收入",
      "qingxuanzhe":"请选择",
      "qing3fenzhonghoushuaxin":"请3分钟后刷新本页,查询进度",
      "chongzhixiangqing":"充值详情",
      "chongzhixingming":"充值姓名",
      "dingdanbianhao":"订单编号",
      "chongzhijine":"充值金额",
      "zhongwenjianti":"中文简体",
      "yingyu":"英语",
      "yuenanyu":"越南语",
      "jintian":"今天",
      "zuijin7tain":"最近7天",
      "zuijin30tian":"最近30天",
      "quanbuzhuangtai":"全部状态",
      "chenggong":"成功",
      "chulizhong":"处理中",
      "yiquxiao":"已取消",
      "quanbufangshi":"全部方式",
      "changyongduanyu":"常用短语",
      "qitaduanyu":"其他短语",
      "biaoqing":"表情",
      "gif":"GIF",
      "shifoutuichudenglu":"是否退出登录",
      "fuzhichenggong":"复制成功",
      "qiehuanquanjuqianbao":"切换全局钱包",
      "tuijianyouli":"推荐有礼",
      "zanwuyouxi":"暂无游戏~",
      "fangwenluxian":"访问路线选择",
      "kuai":"快",
      "yiban":"一般",
      "henman":"很慢",
      "bukeyong":"不可用",
      "fanshuishuoming":"返水说明",
      "jiazaizhong":"加载中...",
      "weikaishi":"未开始",
      "jinxingzhong":"进行中",
      "yijieshu":"已结束",
      "hongbaohuodong":"红包活动",
      "xiangqing":"详情",
      "qingxiandenglu":"您还没登录，请先登录~",
      "jingqingqidai":"敬请期待~",
      "denglugengjingcai":"登录更精彩",
      "gengduo":"更多",
      "huishou":"回收",
      "sishiershuzihuozimu":"用户名请输入4-12位数字或字母",
      "bashiershuzihuozimu":"密码请输入8-12位数字或字母",
      "zhenshixingmingbunengkong":"请输入真实姓名",
      "yanzhengmabunengkong":"请输入验证码",
      "mimashurubuyizhi":"两次密码输入不一致",
      "usdt_coin":"USDT币",
      "lianxizaixiankefu":"请联系在线客服",
      "shuruzhuanzhangqianbao":"请输入您转账时使用的钱包地址",
      "yiwanchengtijiaorukuan":"已完成转账，提交入款申请",
      "qianbaodizhi":"钱包地址",
      "shifoujinxingzhuanzhang":"您是否像收款账号进行了转账",
      "tishi":"提示",
      "yinhangmingcheng":"银行名称",
      "xuanzhezhifuyinhang":"选择支付银行",
      "zhifutiaozhuan":"支付跳转%s",
      "quedingtijiaodingdan":"确定要提交订单吗？",
      "caozuochenggong":"操作成功",
      "zhuzhanghao":"主账号",
      "qingxuanzhezhuanru":"请选择转入账户",
      "qingxuanzhezhuanchu":"请选择转出账户",
      "qingxuanzhetikuanzhanghu":"请选择提款账户",
      "dianjitianjiazhanghu":"点击添加账户",
      "ninhaimeibangdingyhkzhanghu":"您还没绑定银行卡账户",
      "ninhaimeibangdingusdtzhanghu":"您还没绑定USDT账户",
      "qubangding":"去绑定",
      "chukuanzhanghu":"出款账户",
      "chukuanyinhang":"出款银行",
      "kaihudizhi":"开户地址",
      "yanzhengchukuanmima":"验证出款密码",
      "shuruyinhangkakaihudizhi":"输入银行卡开户地址",
      "liudao12weishuzihuozimu":"6-12位数字或字母",
      "yigezhanghaosanzhangyinhangka":"1.一个账号只能绑定三张提现银行卡；\n2.如需修改请联系客服人员",
      "qingshuruqianbaodizhi":"请输入钱包地址",
      "qingshuruqukuanmima":"请输入取款密码",
      "qianbaoxieyi":"钱包协议",
      "yanzhengzijinmima":"验证资金密码",
      "shuruyinhangzhanghao":"输入银行账号",
      "qingxuanzhechukuanyinhang":"请选择出款银行",
      "qingshuruchukuanmima":"请输入出款密码",
      "trc20_show":"TRC20 (波场网络)",
      "erc20_show":"ERC20 (以太网)",
      "omni_show":"OMNI (比特币网络)",
      "tuiguanghongli":"推广红利",
      "sidao12shuzihuozimu":"4-12位数字或字母",
      "mimacuowu":"密码错误",
      "zhanghaomimadenglu":"账号密码登录",
      "chongzhijymm":"重置简易密码",
      "chongzhijymmtishi":"重置简易密码后，将清空您设置的简易密码，请使用用户名密码登录。登录成功后，会自动抹除简易密码。",
      "qingzaiciyanzhenghaxizhi":"请在此处输入或粘贴你想要验证的哈希值",
      "geshangqi":"隔上期",
      "jinrikai":"今日开",
      "wodeshoucang":"我的收藏",
      "lianxiwomen":"联系我们",
      "2023guojizhan":"@2023国际站",





    },
  };

}

