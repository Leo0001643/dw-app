import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../app_env.dart';
import 'interceptors/common.dart';

class Fetch {
  static final Fetch _instance = Fetch._internal();

  factory Fetch() => _instance;

  static late final Dio dio;
  static late final CookieJar cookieJar;

  Fetch._internal();

  static init(String baseUrl, [String? device]) {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: AppEnv.config.appDomain,
      connectTimeout: 60000,
      receiveTimeout: 60000,
      sendTimeout: 60000,
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
      headers: {
        'Requested-Device': device ?? 'APP',
        'Requested-API-VERSION': 1,
        'X-Requested-With': 'XMLHttpRequest',
        'isSports':AppEnv.config.isSports,
        'Requested-Site': Uri.parse(AppEnv.config.appDomain).host,
      },
    );

    dio = Dio(baseOptions);

    // business logic
    dio.interceptors.add(CommonInterceptor());

    // cookie handler
    cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        retries: 3,
        retryDelays: [
          const Duration(seconds: 5),
          const Duration(seconds: 5),
          const Duration(seconds: 5),
        ],
      ),
    );

    // logger
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true,
        ),
      );
    }
  }

  // to be deprecated
  static Future get(
    String path, {
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    var response = await dio.get(
      path,
      queryParameters: query,
      options: options,
    );

    return response.data;
  }

  // to be deprecated
  static Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool? noLoading = false,
  }) async {
    options ??= Options();
    Options option = options.copyWith(extra: {
      'noLoading': noLoading,
    });
    var response = await dio.post(
      path,
      data: data,
      options: option,
      cancelToken: cancelToken,
    );

    return response.data;
  }
}
