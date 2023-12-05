
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/error_response_handler.dart';
import 'package:leisure_games/app/network/retrofit_client.dart';
import 'package:leisure_games/ui/bean/act_status_entity.dart';
import 'package:leisure_games/ui/bean/back_water_desc_entity.dart';
import 'package:leisure_games/ui/bean/back_water_entity.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';
import 'package:leisure_games/ui/bean/bank_entity.dart';
import 'package:leisure_games/ui/bean/base_response_entity.dart';
import 'package:leisure_games/ui/bean/bet_record_group_entity.dart';
import 'package:leisure_games/ui/bean/bonus_total_entity.dart';
import 'package:leisure_games/ui/bean/constitute_ratio_entity.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';
import 'package:leisure_games/ui/bean/day_return_water_details_entity.dart';
import 'package:leisure_games/ui/bean/deposit_log_entity.dart';
import 'package:leisure_games/ui/bean/dew_info_entity.dart';
import 'package:leisure_games/ui/bean/digiccy_channel_entity.dart';
import 'package:leisure_games/ui/bean/digiccy_deposit_data_entity.dart';
import 'package:leisure_games/ui/bean/domain_config_entity.dart';
import 'package:leisure_games/ui/bean/expression_entity.dart';
import 'package:leisure_games/ui/bean/flow_data_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/game_type_entity.dart';
import 'package:leisure_games/ui/bean/help_entity.dart';
import 'package:leisure_games/ui/bean/history_lotto_entity.dart';
import 'package:leisure_games/ui/bean/is_permit_entity.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';
import 'package:leisure_games/ui/bean/member_point_entity.dart';
import 'package:leisure_games/ui/bean/message_item_entity.dart';
import 'package:leisure_games/ui/bean/news_rate_entity.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:leisure_games/ui/bean/payment_channel_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/bean/phrase_entity.dart';
import 'package:leisure_games/ui/bean/pic30_back_entity.dart';
import 'package:leisure_games/ui/bean/pic30_entity.dart';
import 'package:leisure_games/ui/bean/platform_entity.dart';
import 'package:leisure_games/ui/bean/point_record_entity.dart';
import 'package:leisure_games/ui/bean/prize_list_entity.dart';
import 'package:leisure_games/ui/bean/promotion_detail_entity.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';
import 'package:leisure_games/ui/bean/site_wallet_config_entity.dart';
import 'package:leisure_games/ui/bean/spread_promos_data_entity.dart';
import 'package:leisure_games/ui/bean/spread_user_entity.dart';
import 'package:leisure_games/ui/bean/trend_response_entity.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';
import 'package:leisure_games/ui/bean/user_detail_entity.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';
import 'package:leisure_games/ui/bean/var_code_entity.dart';
import 'package:leisure_games/ui/bean/web_config_entity.dart';
import 'package:leisure_games/ui/bean/withdraw_check_entity.dart';

class HttpService{

  static late RetrofitClient _client;

  static void doInit(){
    var dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler){
        options.headers["Content-Type"] = "application/x-www-form-urlencoded";
        options.headers["Accept-Language"] = Intr().currentLocale().languageCode;

        //设备信息【PC:PC网页端,MP:移动端,APP:原生APP】
        //网站ID
        //机器型号
        //系统版本号【APP强制使用】
        options.queryParameters["machineModel"] = Constants.model();
        options.queryParameters["siteId"] = "9000";
        options.queryParameters["siteType"] = "1";
        options.queryParameters["terminal"] = "APP";
        options.queryParameters["version"] = Constants.version();
        loggerArray(["发起请求","${options.path}\n","${options.method}\n","${options.headers}\n",options.data ?? options.queryParameters]);
        handler.next(options);
      },
      onResponse: (response, handler){
        loggerArray(["返回响应",response.requestOptions.path,response.statusCode,"${response.statusMessage}\n",response.data]);
        if(response.statusCode == 200){
          handler.next(response);
        }else {
          ErrorResponseHandler().onErrorHandle({"code": response.statusCode,"message": response.statusMessage});
        }
      },
      onError: (DioException e, handler){
        loggerArray(["异常响应",e.toString()]);
        handler.next(e);
      }
    ));
    _client = RetrofitClient(dio);
  }


  static Future<List<GameKindEntity>> getGameKind(){
    return buildFuture<List<GameKindEntity>>(()=> _client.getGameKind());
  }

  ///公告类型【公告类型，1普通公告(主站)-11普通公告(副站)，2跳弹公告(主站)-21跳弹公告(副站)】
  static Future<List<NoticeEntity>> getNotice(int noteType){
    return buildFuture<List<NoticeEntity>>(()=> _client.getNotice(noteType));
  }

  //图片类型【logo=获取logo图片,promotiontype=优惠活动分类,promotion=优惠活动图片,
  // news=新闻,newstag=获取新闻标签,rotate=获取轮播内容,promotiondetail=获取优惠活动详情,
  // actdoc=获取活动资讯,actpic=获取活动图片,notice=弹窗公告信息,AdvertisingPic=原生添加启动页,
  // AllSend=全站,rotateAll=所有轮播,agentNewsTag=代理资讯标签,agentNews=代理资讯,actdoc=活动资讯,gameRules=PC28规则,gameRulesTag=PC28目标规则】
  static Future<List<Pic30Entity>> getRotate(){
    return buildFuture<List<Pic30Entity>>(()=> _client.getRotate("rotate",Constants.imageType));
  }

  static Future<Pic30BackEntity> getActPic(){
    return buildFuture<Pic30BackEntity>(()=> _client.getActPic("actpic",Constants.imageType));
  }

  static Future<PromotionTypeEntity> getPromotionTpe(){
    return buildFuture<PromotionTypeEntity>(()=> _client.getPromotionTpe("promotiontype",Constants.imageType));
  }

  static Future<PromotionDetailEntity> getPromotionDetail(String tag){
    return buildFuture<PromotionDetailEntity>(()=> _client.getPromotionDetail("promotiondetail",tag,Constants.imageType));
  }

  static Future<NewsRateEntity> getNewsRate(String tag){
    return buildFuture<NewsRateEntity>(()=> _client.getNewsRate("news",tag,Constants.imageType));
  }

  static Future<NewsRateEntity> getGameRole(String tag){
    return buildFuture<NewsRateEntity>(()=> _client.getNewsRate("gameRules",tag,Constants.imageType),loading: false);
  }

  static Future<Pc28LottoEntity> getPc28LottoList(){
    return buildFuture<Pc28LottoEntity>(()=> _client.getPc28LottoList());
  }

  static Future<ActStatusEntity> getActStatus(){
    return buildFuture<ActStatusEntity>(()=> _client.getActStatus());
  }

  static Future<WebConfigEntity> getWebConfig(){
    return buildFuture<WebConfigEntity>(()=> _client.getWebConfig(),loading: false);
  }

  static Future<DomainConfigEntity> getDomainConfig(){
    return buildFuture<DomainConfigEntity>(()=> _client.getDomainConfig(),loading: false);
  }

  static Future<List<GameTypeEntity>> getGameType(){
    return buildFuture<List<GameTypeEntity>>(()=> _client.getGameType());
  }

  static Future<List<CustomerServiceEntity>> getCustomerService(){
    return buildFuture<List<CustomerServiceEntity>>(()=> _client.getCustomerService());
  }

  static Future<String> historyHall(){
    //Map<String,HistoryHall>
    return buildTrendFuture<String>(()=> _client.historyHall());
  }

  static Future<List<HistoryLottoEntity>> historyList(int lid, int pageIndex, int pageSize){
    return buildTrendFuture<List<HistoryLottoEntity>>(()=> _client.historyList(lid, pageIndex, pageSize),loading: false);
  }

  static Future<DewInfoEntity> getDewInfo(String gameType,String countTerm,String lotteryVersion){
    return buildFuture<DewInfoEntity>(()=> _client.getDewInfo(gameType, countTerm,lotteryVersion));
  }

  static Future<List<ExpressionEntity>> getExpression(){
    return buildFuture<List<ExpressionEntity>>(()=> _client.getExpression(),loading: false);
  }

  static Future<List<PhraseEntity>> getPhrase(){
    return buildFuture<List<PhraseEntity>>(()=> _client.getPhrase(),loading: false);
  }

  static Future<String> getPC28Odds(int id,){
    return buildFuture<String>(()=> _client.getPC28Odds(id));
  }

  static Future<LoginUserEntity> login(Map<String,dynamic> params,){
    return buildFuture<LoginUserEntity>(()=> _client.login(params));
  }

  static Future<BalanceEntity> getBalance(Map<String,dynamic> params,){
    return buildFuture<BalanceEntity>(()=> _client.getBalance(params));
  }

  static Future<BonusTotalEntity> queryBonus(Map<String,dynamic> params,){
    return buildFuture<BonusTotalEntity>(()=> _client.queryBonus(params));
  }

  static Future<MemberPointEntity> queryMemberPoint(Map<String,dynamic> params,){
    return buildFuture<MemberPointEntity>(()=> _client.queryMemberPoint(params));
  }

  static Future<PaymentListEntity> getPaymentList(String oid,String username,){
    return buildFuture<PaymentListEntity>(()=> _client.getPaymentList(oid,username));
  }

  ///渠道【登录:login,会员注册:register,代理注册:agentReg】
  static Future<VarCodeEntity> getVarcode(String channel,){
    return buildFuture<VarCodeEntity>(()=> _client.getVarcode(channel,));
  }

  static Future<String> memberRegCheck(String realName,){
    return buildFuture<String>(()=> _client.memberRegCheck(realName,),loading: false);
  }

  static Future<LoginUserEntity> userRegister(Map<String,dynamic> params,){
    return buildFuture<LoginUserEntity>(()=> _client.userRegister(params,),loading: false);
  }

  static Future<List<MessageItemEntity>> getMessage(String oid,String username,){
    return buildFuture<List<MessageItemEntity>>(()=> _client.getMessage(oid,username));
  }

  static Future<DigiccyChannelEntity> getOnlineDigiccyChannel(String oid,String username,){
    return buildFuture<DigiccyChannelEntity>(()=> _client.getOnlineDigiccyChannel(oid,username));
  }

  static Future<PaymentChannelEntity> getPaymentChannel(String oid,String username,String bankCode,){
    return buildFuture<PaymentChannelEntity>(()=> _client.getPaymentChannel(oid,username,bankCode));
  }

  static Future<DigiccyDepositDataEntity> digiccyDeposit(Map<String,dynamic> params,){
    return buildFuture<DigiccyDepositDataEntity>(()=> _client.digiccyDeposit(params,));
  }

  static Future<DigiccyDepositDataEntity> companyDeposit(Map<String,dynamic> params,){
    return buildFuture<DigiccyDepositDataEntity>(()=> _client.companyDeposit(params,));
  }

  ///type:列表类型【1:表示所有银行,2:表示出款银行(排除扫码银行)】
  static Future<List<BankEntity>> getBanks(Map<String,dynamic> params,){
    return buildFuture<List<BankEntity>>(()=> _client.getBanks(params,));
  }

  static Future<DigiccyDepositDataEntity> onlineDeposit(Map<String,dynamic> params,){
    return buildFuture<DigiccyDepositDataEntity>(()=> _client.onlineDeposit(params,));
  }

  static Future<List<DepositLogEntity>> queryDepositLog(Map<String,dynamic> params,){
    return buildFuture<List<DepositLogEntity>>(()=> _client.queryDepositLog(params,));
  }

  static Future<List<PaymentListBanks>> queryDepositType(Map<String,dynamic> params,){
    return buildFuture<List<PaymentListBanks>>(()=> _client.queryDepositType(params,));
  }

  static Future<String> updateUserAvatar(Map<String,dynamic> params,){
    return buildFuture<String>(()=> _client.updateUserAvatar(params,));
  }

  static Future<String> internalTransfer(Map<String,dynamic> params,){
    return buildFuture<String>(()=> _client.internalTransfer(params,));
  }

  static Future<List<IsPermitEntity>> getPlatformIsPermit(Map<String,dynamic> params,){
    return buildFuture<List<IsPermitEntity>>(()=> _client.getPlatformIsPermit(params,));
  }

  static Future<List<PlatformEntity>> getPlatformList(Map<String,dynamic> params,){
    return buildFuture<List<PlatformEntity>>(()=> _client.getPlatformList(params,));
  }

  static Future<String> transfer(Map<String,dynamic> params,){
    return buildFuture<String>(()=> _client.transfer(params,));
  }

  static Future<UserDrawDetailEntity> getUserDrawDetail(Map<String,dynamic> params,){
    return buildFuture<UserDrawDetailEntity>(()=> _client.getUserDrawDetail(params,));
  }

  static Future<WithdrawCheckEntity> withdrawCheck(Map<String,dynamic> params,){
    return buildFuture<WithdrawCheckEntity>(()=> _client.withdrawCheck(params,));
  }

  static Future<List<SiteWalletConfigEntity>> getSiteWalletConfig(Map<String,dynamic> params,){
    return buildFuture<List<SiteWalletConfigEntity>>(()=> _client.getSiteWalletConfig(params,));
  }

  static Future<String> takeSubmit(Map<String,dynamic> params,){
    return buildFuture<String>(()=> _client.takeSubmit(params,));
  }

  static Future<FlowDataEntity> sys800(Map<String,dynamic> params,){
    return buildFuture<FlowDataEntity>(()=> _client.sys800(params,),loading: false);
  }

  static Future<String> changeGetpassword(Map<String,dynamic> params,){
    return buildFuture<String>(()=> _client.changeGetpassword(params,));
  }

  static Future<String> bindDrawDetail(Map<String,dynamic> params,){
    return buildFuture<String>(()=> _client.bindDrawDetail(params,));
  }

  static Future<List<UsdtChannelEntity>> getVMDrawDetail(Map<String,dynamic> params,){
    return buildFuture<List<UsdtChannelEntity>>(()=> _client.getVMDrawDetail(params,));
  }

  static Future<String> bindVMDrawDetail(Map<String,dynamic> params,){
    return buildFuture<String>(()=> _client.bindVMDrawDetail(params,));
  }

  static Future<BetRecordGroupEntity> getRecordGroupDay(Map<String,dynamic> params,){
    return buildFuture<BetRecordGroupEntity>(()=> _client.getRecordGroupDay(params,));
  }

  static Future<PointRecordEntity> queryPointLog(Map<String,dynamic> params,){
    return buildFuture<PointRecordEntity>(()=> _client.queryPointLog(params,),loading: false);
  }

  static Future<List<BackWaterEntity>> backWaterTotal(Map<String,dynamic> params,){
    return buildFuture<List<BackWaterEntity>>(()=> _client.backWaterTotal(params,),loading: false);
  }

  static Future<BackWaterDescEntity> getNewsBack(String tag){
    return buildFuture<BackWaterDescEntity>(()=> _client.getNewsBack("news",tag,Constants.imageType));
  }

  static Future<ConstituteRatioEntity> queryConstituteRatio(Map<String,dynamic> params,){
    return buildFuture<ConstituteRatioEntity>(()=> _client.queryConstituteRatio(params));
  }

  static Future<DayReturnWaterDetailsEntity> dayReturnWaterDetails(Map<String,dynamic> params,){
    return buildFuture<DayReturnWaterDetailsEntity>(()=> _client.dayReturnWaterDetails(params));
  }

  static Future<PrizeListEntity> getPrize(Map<String,dynamic> params,){
    return buildFuture<PrizeListEntity>(()=> _client.getPrize(params));
  }

  static Future<List<SpreadUserEntity>> getSpreadUser(Map<String,dynamic> params,){
    return buildFuture<List<SpreadUserEntity>>(()=> _client.getSpreadUser(params));
  }

  static Future<SpreadPromosDataEntity> getSpreadPromos(Map<String,dynamic> params,){
    return buildFuture<SpreadPromosDataEntity>(()=> _client.getSpreadPromos(params));
  }

  static Future<String> checkAgentReg(Map<String,dynamic> params,){
    return buildFuture<String>(()=> _client.checkAgentReg(params));
  }

  static Future<String> agentRegister(Map<String,dynamic> params,){
    return buildFuture<String>(()=> _client.agentRegister(params));
  }

  static Future<List<HelpEntity>> getHelpCenter(){
    return buildFuture<List<HelpEntity>>(()=> _client.getHelpCenter("newstag",Constants.imageType));
  }

  static Future<UserDetailEntity> getUserDetail(Map<String,dynamic> params,){
    return buildFuture<UserDetailEntity>(()=> _client.getUserDetail(params));
  }

  static Future<String> updateUserDetail(Map<String,dynamic> params,){
    return buildFuture<String>(()=> _client.updateUserDetail(params));
  }



































  ///游戏返回体
  ///封装请求体，自动处理各种异常问题
  static Future<T> buildFuture<T>(RequestCallback callback,{bool loading = true,bool errorHandler = true}) async {
    if(loading){ EasyLoading.show(maskType: EasyLoadingMaskType.black,status: Intr().jiazaizhong); }
    try{
      var value = await callback.call();
      if(loading){ EasyLoading.dismiss(); }
      if(value.isOk()){
        ///data为null时处理
        return Future.value(value.data ?? "");
      } else {
        if(errorHandler){ ErrorResponseHandler().onErrorHandle({"code": value.code,"message": value.message.toString()}); }
        return Future.error(value.message.toString());
      }
    }catch(error){
      loggerArray(["请求异常信息",error]);
      if(loading){ EasyLoading.dismiss(); }
      if(errorHandler){ ErrorResponseHandler().onErrorHandle(error); }
      return Future.error(error);
    }
  }


  ///彩票返回体
  ///封装请求体，自动处理各种异常问题
  static Future<T> buildTrendFuture<T>(RequestTrendCallback callback,{bool loading = true,bool errorHandler = true}) async {
    if(loading){ EasyLoading.show(maskType: EasyLoadingMaskType.black,status: Intr().jiazaizhong); }
    try{
      var value = await callback.call();
      if(loading){ EasyLoading.dismiss(); }
      if(value.isOk()){
        ///data为null时处理
        return Future.value(value.result ?? "");
      } else {
        if(errorHandler){ ErrorResponseHandler().onErrorHandle({"code": value.status,"message": value.message.toString()}); }
        return Future.error(value.message.toString());
      }
    }catch(error){
      loggerArray(["请求异常信息",error]);
      if(loading){ EasyLoading.dismiss(); }
      if(errorHandler){ ErrorResponseHandler().onErrorHandle(error); }
      return Future.error(error);
    }
  }




}


typedef RequestCallback = Future<BaseResponseEntity<dynamic>> Function();
typedef RequestTrendCallback = Future<TrendResponseEntity<dynamic>> Function();
