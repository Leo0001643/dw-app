import 'package:aone_common/core/fetch/exception/base_api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ServerErrorException extends BaseApiException {
  ServerErrorException({
    required int httpCode,
    required int statusCode,
    required String message,
    Response? response,
  }) : super(
          httpCode: httpCode,
          statusCode: statusCode,
          message: message,
        ) {
    if (kReleaseMode) {
      Sentry.captureException(
        this,
      );
      Sentry.captureMessage(
        '''
        Uri: ${response?.realUri}
        HttpCode: ${response?.statusCode ?? 500}
        RequestHeader:${response?.requestOptions.headers.toString()}
        RequestBody:${response?.requestOptions.data.toString()}
        ResponseBody: ${response?.data.toString()}
        ''',
      );
    }
    SmartDialog.showToast('服务器繁忙，请稍后在重试');
  }
}
