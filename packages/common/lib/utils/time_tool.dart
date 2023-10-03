import 'package:intl/intl.dart';

int currentTimeMillis() {
  return DateTime.now().millisecondsSinceEpoch;
}

String getCurrentTimefor(TimeType timeType) {
  DateTime dateTime = DateTime.now();
  switch (timeType) {
    case TimeType.timetoday:
      {
        return dateTime.toString().substring(0, 10);
      }
    case TimeType.timetominute:
      {
        return dateTime.toString().substring(0, 10);
      }
    case TimeType.day:
      {
        return dateTime.day.toString();
      }
    case TimeType.month:
      {
        return dateTime.month.toString();
      }
    case TimeType.year:
      {
        return dateTime.year.toString();
      }
    case TimeType.hour:
      {
        return dateTime.day.toString();
      }
    case TimeType.minute:
      {
        return dateTime.hour.toString();
      }
    case TimeType.second:
      {
        return dateTime.second.toString();
      }
  }
}

//获取当月天数
getCurrentMonthAllDay() {
  DateTime dateTime = DateTime.now();

  // var year = DateTime.now().year;
  var dayCount = DateTime(dateTime.year, dateTime.month + 1, 0).day;
  var week = DateTime(dateTime.year, dateTime.month, 1).weekday;

  // print('天数 == ${dayCount} ${dateTime.weekday}  === ${week}');

  return dayCount;
}

//获取当月天数
getMonthAllDay(int index) {
  DateTime dateTime = DateTime.now();
  int dayCount = DateTime(dateTime.year, index + 1, 0).day;
  return dayCount;
}

getStartWeekWithMonth(int index) {
  DateTime dateTime = DateTime.now();
  var startWeek = DateTime(dateTime.year, index, 1).weekday;
  return startWeek;
}

getStartWeekWithYearMonth({
  required int year,
  required int month,
}) {
  DateTime dateTime = DateTime.now();
  var startWeek = DateTime(year, month, 1).weekday;
  return startWeek;
}

//获取当前月第一天是星期几
getStartWeek() {
  DateTime dateTime = DateTime.now();
  var startWeek = DateTime(dateTime.year, dateTime.month, 1).weekday;
  return startWeek;
}

enum TimeType {
  timetoday, //时间2022-04-21
  timetominute, //时间2022-04-21 14:00
  day, // 天
  month, // 月
  year, // 年
  hour, // 时
  minute, // 分
  second //妙
}

///字符串转日期格式
DateTime stringToDateTime(String? from) {
  if (from == null || from.isEmpty) return DateTime.now();
  DateTime date = DateFormat("yyyy-MM-dd").parseStrict(from);
  return date;
}

/// 多少年以前的日期
DateTime yearBeforeNow(int yearsAgo) {
  DateTime now = DateTime.now();
  final year = DateTime(now.year - yearsAgo, now.month, now.day);
  return year;
}
