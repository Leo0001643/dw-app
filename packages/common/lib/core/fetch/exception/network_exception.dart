import 'package:aone_common/core/fetch/exception/base_exception.dart';

class NetworkException extends BaseException {
  NetworkException({required String message}) : super(message: message);
}