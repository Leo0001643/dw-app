import 'package:aone_common/core/fetch/exception/base_exception.dart';

class BaseApiException extends BaseException {
  final int httpCode;
  final int statusCode;

  BaseApiException({
    required this.httpCode,
    required this.statusCode,
    required String message,
  }) : super(message: message);
}
