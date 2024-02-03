import 'package:intl/intl.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/number_transition.dart';

/// 千分位加逗号，直接截取，而不是四舍五入,去掉小数点后为0的尾数
String numberFormat(dynamic data,
    {int point = 4,
    comma = true,
    bool isFirst = true,
    bool thousands = true,
    String symbol = "",
    bool isShowMorePoint = false,
    bool needPositive = false,
    String? defautValue = "0"}) {
  if (data == null || data == 0) {
    return "${symbol}0";
  }

  try {
    String numStr = numberFormatFor(data,
        point: point,
        comma: comma,
        isFirst: isFirst,
        symbol: symbol,
        isShowMorePoint: isShowMorePoint,
        needPositive: needPositive);
    if (!numStr.contains(".")) {
      return numStr;
    }
    RegExp regex = RegExp(r"([.]*0+)(?!.*\d)");
    String result = thousands
        ? numStr.replaceAll(regex, "") == ""
            ? "0"
            : numStr.replaceAll(regex, "")
        : numStr.replaceAll(regex, "") == ""
            ? "0"
            : numStr.replaceAll(regex, "").replaceAll(",", "");
    if (result == "${symbol}") {
      result = "${symbol}${defautValue}";
    }
    return result;
  } catch (_) {
    return '${symbol}$defautValue';
  }
}

String rakebackFormat(dynamic data,
    {comma = true,
    bool isFirst = true,
    bool thousands = true,
    String symbol = "",
    bool needPositive = false,
    String? defautValue = "0"}) {
  if (data == null || data == 0) {
    return "${symbol}0";
  }
  RegExp regex = RegExp(r"([.]*0+)(?!.*\d)");

  try {
    String numStr = rakebackFormatFor(data,
        comma: comma,
        isFirst: isFirst,
        symbol: symbol,
        needPositive: needPositive);
    String result = thousands
        ? numStr.replaceAll(regex, "") == ""
            ? "0"
            : numStr.replaceAll(regex, "")
        : numStr.replaceAll(regex, "") == ""
            ? "0"
            : numStr.replaceAll(regex, "").replaceAll(",", "");
    if (result == "\$") {
      result = "\$$defautValue";
    }
    return result;
  } catch (_) {
    return '${symbol}$defautValue';
  }
}

String rakebackFormatFor(dynamic data,
    {comma = true,
    bool isFirst = true,
    bool thousands = true,
    String symbol = "",
    bool needPositive = false}) {
  int poitSecond = 3;

  try {
    if (double.tryParse(data.toString()) == null) {
      return isFirst ? '--' : "获取失败";
    }

    if (data == double.infinity) {
      data = "0.0000";
    }
    if (data == double.negativeInfinity) {
      data = "0.0000";
    }

    final dataStr = data.toString();
    if (symbol.isNotEmpty && double.tryParse(data.toString()) != 0) {
      symbol = (double.tryParse(data.toString())! < 0
              ? '-'
              : (needPositive && double.tryParse(data.toString())! > 0)
                  ? "+"
                  : '') +
          symbol;
    }

    String integer;
    String decimal;
    if (dataStr.contains('.')) {
      final List<String> splitArr = dataStr.split('.');
      integer = splitArr[0];
      if (splitArr[1].length < poitSecond) {
        splitArr[1] = splitArr[1] + '0' * (poitSecond - splitArr[1].length);
      }
      decimal = splitArr[1].length > 1
          ? splitArr[1].substring(0, poitSecond)
          : splitArr[1] + '0' * (poitSecond - 1);
    } else {
      integer = dataStr;
      decimal = '0' * poitSecond;
    }

    bool negative = integer.contains('-0');
    String format = comma ? '###,###,###' : '';
    integer = NumberFormat(format).format(int.parse(integer));
    if (negative && (integer.contains('-')) == false) {
      integer = '-$integer';
    }
    if (symbol.contains("-")) {
      return (symbol +
          (poitSecond == 0 ? integer : integer + '.' + decimal)
              .replaceAll('-', ''));
    } else {
      if (data is String) {
        if (data.contains('.')) {
          data = double.parse(data);
        } else {
          data = int.parse(data);
        }
      }
      if (data == 0) {
        return '${symbol}0';
      } else {
        return symbol + (poitSecond == 0 ? integer : integer + '.' + decimal);
      }
    }
  } catch (_) {
    return '${symbol}0';
    //return '${symbol}0';
  }
}

/// 千分位加逗号，直接截取，而不是四舍五入
String numberFormatFor(dynamic data,
    {int point = 2,
    comma = true,
    bool isFirst = true,
    bool thousands = true,
    String symbol = "",
    bool isShowMorePoint = false,
    bool needPositive = false}) {
  int poitSecond = 0;
  if (point > 0) {
    poitSecond = 2;
  }
  if (isShowMorePoint) {
    poitSecond = point;
  }

  try {
    if (double.tryParse(data.toString()) == null) {
      return isFirst ? '--' : "获取失败";
    }

    if (data == double.infinity) {
      data = "0.0000";
    }
    if (data == double.negativeInfinity) {
      data = "0.0000";
    }

    final dataStr = data.toString();
    if (symbol.isNotEmpty && double.tryParse(data.toString()) != 0) {
      symbol = (double.tryParse(data.toString())! < 0
              ? '-'
              : (needPositive && double.tryParse(data.toString())! > 0)
                  ? "+"
                  : '') +
          symbol;
    }

    String integer;
    String decimal;
    if (dataStr.contains('.')) {
      final List<String> splitArr = dataStr.split('.');
      integer = splitArr[0];
      if (splitArr[1].length < poitSecond) {
        splitArr[1] = splitArr[1] + '0' * (poitSecond - splitArr[1].length);
      }
      decimal = splitArr[1].length > 1
          ? splitArr[1].substring(0, poitSecond)
          : splitArr[1] + '0' * (poitSecond - 1);
    } else {
      integer = dataStr;
      decimal = '0' * poitSecond;
    }

    bool negative = integer.contains('-0');
    String format = comma ? '###,###,###' : '';
    integer = NumberFormat(format).format(int.parse(integer));
    if (negative && (integer.contains('-')) == false) {
      integer = '-$integer';
    }
    if (symbol.contains("-")) {
      return (symbol +
          (poitSecond == 0 ? integer : integer + '.' + decimal)
              .replaceAll('-', ''));
    } else {
      if (data is String) {
        if (data.contains('.')) {
          data = double.parse(data);
        } else {
          data = int.parse(data);
        }
      }
      if (data == 0) {
        return '${symbol}0';
      } else {
        return symbol + (poitSecond == 0 ? integer : integer + '.' + decimal);
      }
    }
  } catch (_) {
    return '${symbol}0';
    //return '${symbol}0';
  }
}


String newCurrencyNumFnumberFormat(num? data,
    {int point = 4, comma = true, bool isFirst = true, currency = ''}) {
  if (currency == null) {
    currency = '';
  }
  String result =
      numberFormat(data?.abs(), point: point, comma: comma, isFirst: isFirst);
  return currency + result;
}


String contentTextFormat(dynamic content, {int point = 2, comma = true}) {
  if (content == null) return '';
  if (content is double) {
    if (content.abs() > 100000000.0) {
      return "${numberFormat(content / 1000, point: 0)}k";
    }
    return numberFormat(content, point: point);
  }
  return '$content';
}

String getDepositUsdtAmountByRate(num amount, num rate) {
  try {
    final expectPayedUsdt = (amount / rate).fixed(3);
    final strArr = expectPayedUsdt.toString().split('.');
    final intArr = strArr[0];
    final decimalArr = strArr[1].split('');
    int first = int.parse(decimalArr[0]);
    int second = int.parse(decimalArr[1]);
    int third = int.parse(decimalArr[2]);
    if (third > 0) {
      ++second;
      first = second > 9 ? ++first : first;
      second = second > 9 ? 0 : second;
      return '$intArr.$first$second';
    } else {
      return '$intArr.$first$second';
    }
  } catch (_) {
    return (amount / rate).fixed(2);
  }
}

String getDurationByMs(int ms) {
  try {
    final Duration d = Duration(milliseconds: ms);
    final List<String> list = d.toString().split(':');
    final String h = int.parse(list[0]) < 10 ? '0${list[0]}' : list[0];
    final String m = list[1];
    final String s = list[2].substring(0, 2);
    return '$h:$m:$s';
  } catch (_) {
    return '00:00:00';
  }
}

String realNameFormat(String realName) {
  realName = realName.replaceAll("-", '');
  if (realName.length <= 0) return '';
  int markNum = realName.length > 25 ? 25 : realName.length - 1;
  return realName.replaceRange(0, realName.length - 1, "*" * markNum);
}

// 把倒计时秒换算成十，分，秒计时
String convertTimeSystem(int seconds) {
  //以秒为单位，根据总秒数，计算小时，分钟，秒
  int hour = (seconds ~/ 3600) % 24;
  int minute = seconds % 3600 ~/ 60;
  int second = seconds % 60;

  var str = '';
  if (hour > 10) {
    str = '$str$hour:';
  } else {
    str = '${str}0$hour:';
  }

  //当只有个位数时，给前面加“0”，实现效果：“:01”,":02"
  if (minute / 10 < 1) {
    // ignore: prefer_interpolation_to_compose_strings
    str = str + '0' + minute.toString() + ":";
  } else {
    str = "$str$minute:";
  }

  if (second / 10 < 1) {
    str = '${str}0$second';
  } else {
    str = str + second.toString();
  }
  return str;
}

String NumberForCardNo(String cardNo,
    {int? splitNum = 4, String? preCardNo = ''}) {
  if (cardNo.isEmpty) {
    return preCardNo! + cardNo;
  }

  if (cardNo.length < splitNum!) {
    return preCardNo! + cardNo;
  }
  String preStr = cardNo.substring(0, splitNum) + " ";
  String afterCode = cardNo.substring(splitNum, cardNo.length);
  preCardNo = preCardNo! + preStr;
  return NumberForCardNo(afterCode, splitNum: splitNum, preCardNo: preCardNo);
}

String removeDecimalZero(
  double value, {
  bool isTransition = false,
}) {
  if (isTransition && value > 1000) {
    return value.transitionNumUnit();
  }
  String formattedValue = value.toString();
  if (formattedValue.contains('.') &&
      (formattedValue.endsWith('.0') || formattedValue.endsWith('.00'))) {
    formattedValue = formattedValue.replaceAll(RegExp(r'\.0*$'), '');
  }
  return formattedValue;
}

String removeDecimalZeroNum(double value) {
  String unit = '';
  double numStr = value;
  if (value >= 1000 && value < 1000000) {
    numStr = (value / 1000);
    unit = 'k';
  } else if (value >= 1000000 && value < 1000000000) {
    numStr = (value / 1000000);
    unit = 'M';
  } else if (value >= 1000000000) {
    numStr = (value / 1000000000);
    unit = 'B';
  }
  String formattedValue = numStr.toString();
  if (formattedValue.contains('.') &&
      (formattedValue.endsWith('.0') || formattedValue.endsWith('.00'))) {
    formattedValue = formattedValue.replaceAll(RegExp(r'\.0*$'), '');
  }
  return formattedValue + unit;
}

// 是否是小数
bool isDecimal(double input) {
  return input % 1 != 0;
}

extension NumExtension on num {
  /// 小数点截取 [fractionDigits] 位
  String fixed(int fractionDigits) {
    final String fixString = toStringAsFixed(fractionDigits + 1);
    return fixString.substring(0, fixString.length - 1);
  }
}
