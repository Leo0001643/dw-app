
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
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/game_type_entity.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/bean/pc28_plan_entity.dart';
import 'package:leisure_games/ui/bean/pic30_back_entity.dart';
import 'package:leisure_games/ui/bean/pic30_entity.dart';
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






}


typedef RequestCallback = Future<BaseResponseEntity<dynamic>> Function();
