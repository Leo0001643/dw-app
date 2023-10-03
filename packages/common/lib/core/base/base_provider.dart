import 'dart:collection';

import 'package:aone_common/common.dart';
import 'package:aone_common/core/fetch/exception/base_exception.dart';
import 'package:aone_common/core/fetch/exception/app_exception.dart';
import 'package:aone_common/core/fetch/exception_handler.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

abstract class BaseProvider {
  Dio get fetch => Fetch.dio;

  Future<Response<T>> fetchWithErrorHandler<T>(Future<Response<T>> api) async {
    (Fetch.dio.httpClientAdapter as DefaultHttpClientAdapter)
        .onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) {
        return true; // 返回true强制通过
      };
    };
    try {
      final response = await api;
      return response;
    } on DioError catch (err) {
      Exception exception = exceptionHandler(err);
      throw exception;
    } catch (err) {
      if (err is BaseException) {
        rethrow;
      }
      throw AppException(message: err.toString());
    }
  }
}
