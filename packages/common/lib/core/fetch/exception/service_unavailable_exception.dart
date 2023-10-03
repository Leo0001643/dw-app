import 'package:aone_common/common.dart';
import 'package:aone_common/core/fetch/exception/base_api_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ServiceUnavailableException extends BaseApiException {
  ServiceUnavailableException({
    required int statusCode,
  }) : super(
          httpCode: 200,
          statusCode: statusCode,
          message: '站点维护中',
        ) {
    SmartDialog.showToast('站点维护中');
    EventBus.emit(EventType.onSiteMaintain);
  }
}
