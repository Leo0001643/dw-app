import 'package:aone_common/core/fetch/exception/base_exception.dart';

// todo: collect error log here
class AppException implements Exception {
  String message;
  AppException({required this.message});
}