

import 'package:leisure_games/app/intl/intr.dart';

class DataUtils{

  /// get WeekDay.
  /// dateTime
  static String getWeekday(DateTime? dateTime) {
    if (dateTime == null) return "";
    String weekday = "";
    switch (dateTime.weekday) {
      case 1:
        weekday = Intr().day_yi;
        break;
      case 2:
        weekday = Intr().day_er;
        break;
      case 3:
        weekday = Intr().day_san;
        break;
      case 4:
        weekday = Intr().day_si;
        break;
      case 5:
        weekday = Intr().day_wu;
        break;
      case 6:
        weekday = Intr().day_liu;
        break;
      case 7:
        weekday = Intr().day_ri;
        break;
      default:
        break;
    }
    return weekday;
  }


}


