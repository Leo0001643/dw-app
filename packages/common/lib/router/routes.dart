/*
 * @Author: your name
 * @Date: 2022-04-09 22:22:10
 * @LastEditTime: 2022-04-09 22:25:50
 * @LastEditors: your name
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /flutter_app/packages/common/lib/router/routes.dart
 */
/// routes name schemas
abstract class Routes {
  // general 一般
  static const splash = '/splash';
  static const maintain = '/maintain'; // 维护界面
  static const home = '/home'; // 首页
  static const main = '/main'; //主tabbar
  static const webPage = '/web_page'; // web展示界面
  static const webServicePage = '/webServicePage'; // 客服web展示界面
  static const helpCenter = '/helpCenter';
  static const article = '/article'; //文章路由
  static const qAndA = '/qa'; //静态文章
  static const franchisee = '/franchisee'; // 合作共赢（代理文章）
  static const brand = '/brand'; // 品牌
  static const upgrade = '/upgrade'; // 升级

  // authenticate 鉴权
  static const login = '/login'; // 登录
  static const userReg = '/register'; //会员注册路由
  static const agentReg = '/agentRegister'; //代理注册路由
  static const forgetPwd = '/forgetPwd'; //忘记密码路由

  // activities 活动
  static const activity = '/activity'; //优惠活动
  static const activityDetail = '/activityDetail'; //优惠活动
  static const myPreferential = '/myPreferential'; //我的优惠
  static const welfareCenter = '/welfare'; // 进入福利界面
  static const signCenter = '/signCenter'; //签到中心路由
  static const grabRed = '/grabRed'; //抢红包路由
  static const taskCenter = '/taskCenter'; //任务中心路由
  static const vipCenter = '/vipCenter'; //VIP中心路由
  static const fortuneWheel = '/fortuneWheel'; //大转盘活动路由
  static const betBackWater = '/betBackWater'; // 进入福利界面

  // game 游戏
  static const gameInit = '/gameInit'; //游戏加载路由
  static const gameCategory = '/gameCategory'; //电子、棋牌游戏展示路由
  static const gameWebView = '/gameWebView'; // 进入第三方游戏页面
  static const strongActivity = '/strongActivity'; // 充值界面（oscar add）
  static const siteRecommend = '/siteRecommend'; //本站推荐、强档活动路由
  static const gameSearch = '/gameSearch'; //游戏搜索路由
  static const gameProviders = '/gameProviders'; //游戏提供商
  static const allGame = '/allGame'; //全部游戏
  static const childGame = '/childGame'; //全部游戏

  // user 用户
  static const user = '/user'; //会员中心路由
  static const accountData = '/accountData'; //账号信息
  static const accountDataModify = '/accountDataModify'; //修改个人信息
  static const accountPhoneData = '/accountPhoneData'; //手机号码展示
  static const popularize = '/popularize'; // 进入推广界面
  static const commissionDes = '/commissionDes'; // 佣金说明
  static const myCollect = '/myCollect'; //我的收藏路由
  static const loginPwdSet = '/loginPwdSet'; //登录密码设置路由
  static const withdrawPwdSet = '/withdrawPwdSet'; //取款密码设置路由
  static const securitySet = '/securitySet'; //安全问题设置路由

  // cashier 收银台
  static const recharge = '/recharge'; // 充值界面（oscar add）
  static const onlineDep = '/onlineDep'; //线上充值路由
  static const transferDep = '/transferDep'; //线下充值路由
  static const transferChannel = '/transferChannel';
  static const vipDep = '/vipDep'; //VIP充值路由
  static const withdraw = '/withdraw'; //提现路由
  static const rechargeTutorial = '/rechargeTutorial'; //充值教程
  static const allRechargeTutorial = '/allRechargeTutorial'; //单独的所有的充值教程
  static const perfectDrawInfo = '/perfectDrawInfo'; //完善取款信息

  // report 报表 / history 记录
  static const betHistory = '/betHistory'; //游戏报表路由
  static const betHistoryDetail = '/betHistoryDetail'; //游戏投注记录详情

  static const depositRecord = '/depositRecord'; //充值报表路由
  static const depositRecordDetail = '/depositRecordDetail'; //充值报表详情路由

  static const withdrawRecord = '/withdrawRecord'; //提现报表路由
  static const withdrawRecordDetail = '/withdrawRecordDetail'; //提现报表详情路由

  static const rebateRecord = '/rebateRecord'; //返水报表路由
  static const rebateRecordDetail = '/rebateRecordDetail'; //返水报表详情路由

  static const billRecord = '/billRecord'; //账单报表路由

  static const promoRecord = '/promoRecord'; //优惠报表详情路由
  static const promoRecordDetail = '/promoRecordDetail'; //优惠报表路由

  // notification 通知
  static const notices = '/notice'; //公告路由
  static const noticesDetail = '/noticesDetail'; //公告详情路由
  static const message = '/message'; //会员消息路由
  static const messageDetail = '/messageDetail'; //会员消息详情

  // wallet 钱包
  static const bankEdit = '/bankEdit'; //银行卡修改路由
  static const bankBind = '/bankBind'; //银行卡绑定路由
  static const coinBind = '/coinBind'; //虚拟币绑定路由
  static const wallet = '/wallet'; //我的钱包路由
  static const walletDetail = '/walletDetail'; //我的钱包路由

  static const betHistoryRecord = '/bet_history_record'; //投注记录
  static const innerWebview = '/innerWebview'; //跳转内嵌浏览器

  static const personRecord = '/personRecord'; //个人报表路由

  static const personPage = '/personPage'; // web展示界面
  static const modifyPasswordPage = '/modifyPasswordPage'; //修改密码(登录密码，取款密码)
  static const modifyInformationPage = '/modifyInformationPage'; // web展示界面
  static const cardManagerPage = '/cardManagerPage'; // web展示界面
  static const promotionRebateView = '/promotionRebateView'; //
  static const collectionsViewPage = '/collectionsViewPage'; //收藏页面

}
