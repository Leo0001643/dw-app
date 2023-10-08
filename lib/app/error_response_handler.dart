
import 'package:rxdart/rxdart.dart';
import '/app/global.dart';
import '/app/logger.dart';

///app全局错误监听处理
class ErrorResponseHandler{

  ErrorResponseHandler._internal();

  static ErrorResponseHandler? instance;

  static ErrorResponseHandler getInstance() {
    if (instance == null) {
      instance = ErrorResponseHandler._internal();
    }
    return instance!;
  }

  factory ErrorResponseHandler() => getInstance();

  void onErrorHandle(dynamic error,{dynamic stackTrace}){
    loggerArray(['onErrorHandle',error,stackTrace]);
    showToast(error.toString());
  }



}