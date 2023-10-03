import 'package:aone_common/core/fetch/exception/jwt_expire_exception.dart';
import 'package:aone_common/core/fetch/exception/server_error_exception.dart';
import 'package:aone_common/core/fetch/exception/service_unavailable_exception.dart';
import 'package:aone_common/core/fetch/exception/unsupported_game_exception.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'exception/bad_request_exception.dart';
import 'exception/app_exception.dart';
import 'exception/network_exception.dart';

Exception exceptionHandler(DioError error) {
  switch (error.type) {
    case DioErrorType.cancel:
      return AppException(message: "请求取消");
    case DioErrorType.connectTimeout:
      return NetworkException(message: "连接超时");
    case DioErrorType.other:
      return NetworkException(message: "无网络链接");
    case DioErrorType.receiveTimeout:
      return NetworkException(message: "请求超时");
    case DioErrorType.sendTimeout:
      return NetworkException(message: "响应超时");
    case DioErrorType.response:
      return _responseErrorParser(error);
  }
}

Exception _responseErrorParser(DioError error) {
  int httpCode = error.response?.statusCode ?? 500;
  int? statusCode;
  String? message;

  try {
    statusCode = error.response?.data["status_code"];
    message = error.response?.data["message"];
  } catch (_) {
    message = "未知错误";
    statusCode = 500;
  }

  switch (httpCode) {
    case 403:
      return ServiceUnavailableException(
        statusCode: statusCode!,
      );
    case 500:
      return ServerErrorException(
        message: message ?? 'exception.504'.tr,
        httpCode: httpCode,
        statusCode: statusCode ?? 500,
        response: error.response,
      );
  }

  switch (statusCode) {
    //取款密码只支持6位数字
    case 422:
    case 400:
      return BadRequestException(
        message: message!,
        httpCode: httpCode,
        statusCode: statusCode!,
      );
    case 401:
      return BadRequestException(
        message: message!,
        httpCode: httpCode,
        statusCode: statusCode!,
      );
    case 3000: // 游戏不支持
      return UnsupportedGameException(
        httpCode: httpCode,
        statusCode: statusCode!,
        message: message!,
      );
    case 5000:
    case 5001: // Token过期
      print('token过期了');
      return JwtExpireException(
        statusCode: statusCode!,
        httpCode: httpCode,
        message: message!,
      );
    case 4001: // ip限制
    case 6002: // 站点维护
      return ServiceUnavailableException(
        statusCode: statusCode!,
      );
    default:
      {
        return ServerErrorException(
          message: message ?? 'exception.504'.tr,
          httpCode: httpCode,
          statusCode: statusCode ?? 500,
          response: error.response,
        );
      }
  }
}
