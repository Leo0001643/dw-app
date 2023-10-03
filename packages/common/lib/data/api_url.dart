abstract class ApiUrl {
  // 首页及站点配置
  static const String homeUI = 'api/webui/home';
  static const String siteHeaders = '/';
  static const String scrollNotice = 'api/site/gdnotice/list';
  static const String bankList = 'api/user/bank/list';
  static const String getBankList = '/api/user/factor/getbanklist';
  static const String articles = '/api/webui/article';
  static const String getAllGames = '/api/webui/getAllGames';
  static const String getSubGamesClass = '/api/webui/subGamesClass';
  static const String getSubGamesByClass = '/api/webui/getSubGamesByClass';
  static const String checkUpdate = 'api/native_app/update_version';

  // 游戏
  static const String trialGames = '/api/get_game/shiwan';
  static const String favoriteList = '/api/webui/favoritesList';
  static const String setFavorite = '/api/webui/favorites';
  static const String gameSubClass = '/api/webui/getGameSubClass';
  static const String allGames = '/api/webui/getAllGames'; //游戏、单类目下游戏搜索
  static const String gameInit = '/api/game/gameInit'; //中转接口
  static const String gameWapPop = '/api/webui/gameWapPop';
  static const String strongActivity = '/api/webui/getStrongActivity';
  static const String hotSearchGames = '/api/webui/getHotSearch';
  static const String getTopGames = '/api/getTop/getTopGames';
  static const String getAllGameImage = '/api/webui/getAllGamesImg';
  static const String gameSearch = 'api/game/search'; //游戏搜索

  //体育
  static const String sportToken = 'api/sport/token'; //自主体育token
  static const String playMenu = 'api/sport/menu'; //游戏分类
  static const String playLive = 'api/sport/game/live'; //滚球税局u

  // 活动相关
  static const String activityTypelistv2 = '/api/activity/typelist_v2';
  static const String activityRewardList = '/api/activity/yhlist';
  static const String collectActivityReward = '/api/activity/yhrecieve';
  static const String rebateAmount = '/api/userFs/fsMoney';
  static const String collectRebate = '/api/userFs/handleFs';
  static const String userJoin = 'api/activity/userjoin_v2';

  // 每日签到

  static const String signinConfig = '/api/qiandao/info'; //签到配置条件
  static const String signinInfo = '/api/user/qiandaoinfo'; //签到信息
  static const String gotoSigin = '/api/user/qiandaov2'; //立即签到
  static const String reissueSignin = '/api/user/reissue'; //补签
  static const String signinReset = '/api/user/qiandaov2reset'; //签到重置

  // 任务中心
  static const String taskCenterInfo = '/api/activity/userinlist_v2';
  static const String applyTaskActivity = '/api/activity/activityapplyv2';

  // 用户报表
  static const String statementReport = '/api/user/liushui/list';
  static const String depositReport = 'api/user/pay/record';
  static const String withdrawReport = 'api/user/putforward/list';
  static const String offerReport = 'api/user/youhui/record';

  static const String betReport = 'api/user/userBetList'; //投注总额
  static const String rebateReport = 'api/user/fanshui/record';
  static const String betDetailReport = 'api/gameBets/betsList'; //所有游戏注单列表
  static const String rechargeCancel = '/api/payv4/qxxxpay';
  static const String backwaterData = '/api/userFs/fsFangan';
  static const String backwaterById = '/api/sitefa/userLadderFsFangAnGameList';
  static const String fsFanganExist = '/api/userFs/fsFanganExist';

  // 用户相关
  static const String beforeLoginInfo = 'api/user/beforeLoginInfo';
  static const String updateUserInfo = 'api/user/handle/contact';
  static const String updateLoginPassword = 'api/user/update/password';
  static const String updateWithdrawPassword = 'api/user/update/qkpass';
  static const String stateHeartBeat = "api/user/userl";
  static const String exit = "api/user/exit";
  static const String sendSMSCode = "api/appcaptchas_phone";

  // 用户钱包
  static const String userMoney = 'api/get_user/money';
  static const String bindingBankCard = 'api/user/binding/bank';
  static const String deleteBankCard = 'api/user/del/bank';
  static const String myBankList = 'api/user/main/logininfo';
  static const String initBinding = 'api/user/factor/tixian';
  static const String totalCount = 'api/user/total/count';
  // 鉴权
  static const String checkToken = '/api/webui/checktoken';
  static const String userLogin = 'api/user/login'; //登录
  static const String registerConfig = 'api/new/register/config'; //注册配置
  static const String userRegister = 'api/user/new/register'; //用户注册
  static const String agentRegister = 'api/agent/new/register'; //代理注册
  static const String forgetPassConfig = 'api/webui/wangjipassConfig'; //忘记密码第一步
  static const String checkSecurityQuestion =
      'api/wjmm/CheckSecurityQuestion'; //忘记密码第二步
  static const String checkOkUser = 'api/wjmm/CheckOkUser'; //忘记密码提交

  //站内信或消息相关
  static const String userMailList = 'api/user/mail/list'; //站内信列表
  static const String userMailDel = 'api/user/mail/del'; //删除站内信
  static const String userMailRead = 'api/user/mail/read'; //全部已读

  //充值相关
  static const String userDeposityh = '/api/users/deposityh';
  static const String payv4Payxsproduct = '/api/payv4/payxsproduct';
  static const String payv4Payxxpay = '/api/payv4/payxxpay';
  static const String payCourse = '/api/Course/getPayCourse';

  //提现相关
  static const String userShenqingTixian = '/api/user/shenqing/tixian';
  static const String userFactorNeed = 'api/user/factor/need'; //查看提现条件

  //推广赚钱相关
  static const String quanmintgYjIntroduce = 'api/quanmintg/yjIntroduce'; //佣金说明
  static const String quanmintgYjOrderList =
      '/api/quanmintg/yjOrderList'; //历史业绩
  static const String quanmintgGetYongJin = '/api/quanmintg/getYongJin'; //领取佣金
  static const String quanmintgUserYjInfo = '/api/quanmintg/userYjInfo'; //推广列表
  static const String quanmintgEchoImg = 'api/quanmintg/echoImg'; //海报相关

  // 首页弹出公告
  static const String userPopupList = 'api/user/popup/list';

  // 红包任务
  static const String redTaskInfo = '/api/activity/showNewHbList'; //初始红包角图相关
  static const String checkRedValid =
      '/api/activity/checkActivityNewHbrwCenter'; //检查红包活动是否开启
  static const String joinRedActivity =
      '/api/activity/activityNewHbsV2'; //判断是否符合参与条件
  static const String redTaskCurrent =
      'api/activity/activityNewHbrwCenter'; //展示红包活动内容
  static const String redTaskLast = 'api/activity/activityNewLastHbrwCenter';
  static const String grabRed = 'api/activity/activityNewHbrwQiang'; //点击领取红包

  //红包雨
  static const String redRainInfo = '/api/activity/showHbList'; //初始红包角图相关
  static const String getHongbao = 'api/activity/hongbao_v2'; //红包雨抢红包

}
