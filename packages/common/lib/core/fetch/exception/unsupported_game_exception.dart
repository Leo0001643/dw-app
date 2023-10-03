import 'package:aone_common/core/fetch/exception/base_api_exception.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class UnsupportedGameException extends BaseApiException {
  UnsupportedGameException({
    required int httpCode,
    required int statusCode,
    required String message,
  }) : super(
          httpCode: httpCode,
          statusCode: statusCode,
          message: message,
        ) {
    // SmartDialog.showToast(message);
  }
}
