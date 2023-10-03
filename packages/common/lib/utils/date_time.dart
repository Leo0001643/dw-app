import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// 时间戳转字符串 默认格式为 yyyy/mm/dd
/// 格式请看下面链接
/// https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html#:~:text=DateFormat%20is%20for%20formatting%20and,name%2C%20field%20order%2C%20etc.
String timeStampIntToString(
  int time, {
  String? format,
}) {
  return DateFormat(format ?? 'yyyy/MM/dd').format(
    DateTime.fromMillisecondsSinceEpoch(time * 1000),
  );
}

String timeStampIntToSecondWithFormat(
  int time, {
  String? format,
}) {
  // print('time == ${time} == ${format}');
  return DateFormat(format ?? 'yyyy-MM-dd HH:mm:ss').format(
    DateTime.fromMillisecondsSinceEpoch(time),
  );
}

String timeStampIntToSecond(
  int time, {
  String? format,
}) {
  // print('time == ${time} == ${format}');
  return DateFormat(format ?? 'yyyy-MM-dd HH:mm:ss').format(
    DateTime.fromMillisecondsSinceEpoch(time * 1000),
  );
}

// 具体同上
String timeStampIntToStringPeriod(
  int startTime,
  int endTime, {
  bool star = true,
  String? format,
  String separator = '~',
}) {
  return (star ? '活动时间 ' : "") +
      timeStampIntToString(startTime, format: format) +
      ' $separator ' +
      timeStampIntToString(endTime, format: format);
}
