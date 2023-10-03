import 'dart:convert';
import 'package:aone_common/common.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart' hide Response;

List<String> urlsNeedCookies = [
  "/api/user/username/exists",
  "/api/user/new/register",
  "/api/user/login",
  "/api/user/userl",
  "/api/user/new/fastregister"
];

Set<String> pendingRequest = {};

String _generateRequestHash({
  required RequestOptions options,
}) {
  var params = options.data ?? options.queryParameters;
  return options.method + options.path + params.toString();
}

String handleRequestLang() {
  var lang = Get.locale?.languageCode.toUpperCase();
  return lang == 'ZH' ? 'CN' : lang ?? 'CN';
}

class CommonInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = SpStorage.jwtToken;
    options.headers['Requested-Language'] = handleRequestLang();
    options.headers['Requested-Agent'];

    if (urlsNeedCookies.indexOf(options.path) >= 1) {
      options.headers['Accept-Cookie'] = csrfTokenGenerator(
        options.baseUrl,
        json.decode(options.data)['username'],
      );
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is String) {
      response.data = jsonDecode(response.data);
    }

    int statusCode = response.data?['status_code'];
    switch (statusCode) {
      case 200:
      case 405:
      case 406:
        return handler.next(response);
      case 401:
      case 400:
        if (response.data?['code'] == 10101) {
          //签到时
          return handler.next(response);
        } else {
          return handler.reject(
            DioError(
              response: response,
              requestOptions: response.requestOptions,
              type: DioErrorType.response,
            ),
            true,
          );
        }
      case 201:
        if (response.data?['code'] == 10102) {
          //红包条件
          return handler.next(response);
        } else {
          return handler.reject(
            DioError(
              response: response,
              requestOptions: response.requestOptions,
              type: DioErrorType.response,
            ),
            true,
          );
        }
      // case 201:
      //   if (response.data?['code'] == 200) {
      //     //红包条件
      //     return handler.next(response);
      //   } else {
      //     return handler.reject(
      //       DioError(
      //         response: response,
      //         requestOptions: response.requestOptions,
      //         type: DioErrorType.response,
      //       ),
      //       true,
      //     );
      //   }
      case 203: //10501
        if (response.data?['code'] == 10501) {
          //大转盘
          return handler.next(response);
        }

        if (response.data?['error_code'] == 2) {
          return handler.next(response);
        } else {
          return handler.reject(
            DioError(
              response: response,
              requestOptions: response.requestOptions,
              type: DioErrorType.response,
            ),
            true,
          );
        }
      default:
        return handler.reject(
          DioError(
            response: response,
            requestOptions: response.requestOptions,
            type: DioErrorType.response,
          ),
          true,
        );
    }
  }
}
