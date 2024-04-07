
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/login_refresh_event.dart';

///app全局错误监听处理
class ErrorResponseHandler {
  ErrorResponseHandler._internal();

  static ErrorResponseHandler? instance;

  static ErrorResponseHandler getInstance() {
    instance ??= ErrorResponseHandler._internal();
    return instance!;
  }

  factory ErrorResponseHandler() => getInstance();

  ///记录一下最后显示吐司的时间
  var lastTime = 0;
  ///记录最后一次吐司的内容
  var lastToast = "";

  void onErrorHandle(dynamic error, {dynamic stackTrace}) {
    loggerArray(['onErrorHandle',lastTime, error, stackTrace]);
    ///控制连续多次弹出同样内容的吐司
    var current = DateTime.now().millisecondsSinceEpoch;
    if(error is Map){
      responseHandler(error);
    } else {
      var toast= error.toString();
      if(toast != lastToast || (current - lastTime) >= 5000){
        lastTime = current;
        lastToast = toast;
        showToast(toast);
      }
    }
  }

  ///服务返回异常处理
  void responseHandler(Map<dynamic, dynamic> error) {
    var toast= error["message"];
    var current = DateTime.now().millisecondsSinceEpoch;
    // loggerArray(["走这里了吗",error]);
    ///错误信息过滤
    if(toast != lastToast || (current - lastTime) >= 5000){
      lastTime = current;
      lastToast = toast;
      switch(error["code"]){
        case 401://Unauthorized
          showToast(toast);
          break;
        case 403://Forbidden
          showToast(toast);
          break;
        case 404://Not Found
          showToast(toast);
          break;
        case 900000://系统异常
          showToast(toast);
          break;
        case 900004://整站维护中 也可能是某个站点维护
          showToast(toast);
          break;
        case 900027://您存取款操作已被停用，请联系客服
          showToast(toast);
          break;
        case 900072://请求参数不合法
          showToast(toast);
          break;
        case 900403://鉴权失败
          ///登录权限已过期，或退出登录
          Get.until((ModalRoute.withName(Routes.main)));
          ///刷新各页面数据
          eventBus.fire(LoginRefreshEvent());
          ///页面切换到首页
          eventBus.fire(ChangeMainPageEvent(0));
          ///清除用户登录信息
          AppData.clear();
          showToast(toast);
          break;
        case 900078://无效的请求方式
          showToast(toast);
          break;
        default:
          showToast(toast);
          break;
      }

    }
  }



}
