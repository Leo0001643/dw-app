
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/error_response_handler.dart';
import 'package:leisure_games/app/network/retrofit_client.dart';
import 'package:leisure_games/ui/bean/act_status_entity.dart';
import 'package:leisure_games/ui/bean/base_response_entity.dart';
import 'package:leisure_games/ui/bean/customer_service_entity.dart';
import 'package:leisure_games/ui/bean/dew_info_entity.dart';
import 'package:leisure_games/ui/bean/domain_config_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/game_type_entity.dart';
import 'package:leisure_games/ui/bean/history_lotto_entity.dart';
import 'package:leisure_games/ui/bean/news_rate_entity.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/bean/pc28_plan_entity.dart';
import 'package:leisure_games/ui/bean/pic30_back_entity.dart';
import 'package:leisure_games/ui/bean/pic30_entity.dart';
import 'package:leisure_games/ui/bean/promotion_detail_entity.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';
import 'package:leisure_games/ui/bean/trend_response_entity.dart';
import 'package:leisure_games/ui/bean/web_config_entity.dart';

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

  ///游戏返回体
  ///封装请求体，自动处理各种异常问题
  static Future<T> buildFuture<T>(RequestCallback callback,{bool loading = true,bool errorHandler = true}) async {
    if(loading){ EasyLoading.show(maskType: EasyLoadingMaskType.black,status: Intr().jiazaizhong); }
    try{
      var value = await callback.call();
      if(loading){ EasyLoading.dismiss(); }
      if(value.isOk()){
        return Future.value(value.data);
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
        return Future.value(value.result);
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
