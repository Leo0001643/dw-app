
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/logger.dart';

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
    loggerArray(['onErrorHandle', error, stackTrace]);
    ///控制连续多次弹出同样内容的吐司
    var current = DateTime.now().millisecond;
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
    switch(error["code"]){
      case 401://Unauthorized
        showToast(error["message"]);
        break;
      case 403://Forbidden
        showToast(error["message"]);
        break;
      case 404://Not Found
        showToast(error["message"]);
        break;
      case 900000://系统异常
        showToast(error["message"]);
        break;
      case 900004://整站维护中
        showToast(error["message"]);
        break;
      case 900072://请求参数不合法
        showToast(error["message"]);
        break;
      case 900403://鉴权失败
        showToast(error["message"]);
        break;
    }
  }



}
