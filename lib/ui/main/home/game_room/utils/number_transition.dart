import 'dart:math';

enum NumTransitionType {
  ceil, //小数向上取值
  truncate, // 小数向下取值
}

extension NumTransition on num {
  // 默认2位小数
  String fixed2ToSting({NumTransitionType type = NumTransitionType.ceil}) {
    return transitionNum(2, type: type);
  }

  double fixed2({NumTransitionType type = NumTransitionType.ceil}) {
    return double.parse(fixed2ToSting(type: type));
  }


  String translationCurrencyNoUnitInteger() {
    return abs().transitionNum(0);
  }

  String translationCurrencyNoUnit() {
    return abs().transitionNumUnit();
  }


  String? get numUnit {
    if (this >= 1000 && this < 1000000) {
      return 'k';
    }
    if (this >= 1000000 && this < 1000000000) {
      return 'M';
    }
    if (this >= 1000000000) {
      return 'B';
    }

    return null;
  }

  // 除以单位后的值
  String? get numWithUnit {
    if (this >= 1000 && this < 1000000) {
      return (this / 1000).transitionNum(2);
    }
    if (this >= 1000000 && this < 1000000000) {
      return (this / 1000000).transitionNum(2);
    }
    if (this >= 1000000000) {
      return (this / 1000000000).transitionNum(2);
    }
    return toInt().toString();
  }

  String transitionNumUnit() {
    String numStr = transitionNum(2, type: NumTransitionType.truncate);
    double num = double.parse(numStr);
    String unit = '';
    if (num >= 1000 && num < 1000000) {
      numStr = (num / 1000).transitionNum(2, type: NumTransitionType.truncate);
      unit = 'k';
    } else if (num >= 1000000 && num < 1000000000) {
      numStr =
          (num / 1000000).transitionNum(2, type: NumTransitionType.truncate);
      unit = 'M';
    } else if (num >= 1000000000) {
      numStr =
          (num / 1000000000).transitionNum(2, type: NumTransitionType.truncate);
      unit = 'B';
    }
    return numStr + unit;
  }

  // 保留一位小数
  String transitionNumUnitSaveOneNum() {
    String numStr = transitionNum(1, type: NumTransitionType.truncate);
    double num = double.parse(numStr);
    String unit = '';
    if (num >= 1000 && num < 1000000) {
      numStr = (num / 1000).transitionNum(1, type: NumTransitionType.truncate);
      unit = 'k';
    } else if (num >= 1000000 && num < 1000000000) {
      numStr =
          (num / 1000000).transitionNum(1, type: NumTransitionType.truncate);
      unit = 'M';
    } else if (num >= 1000000000) {
      numStr =
          (num / 1000000000).transitionNum(1, type: NumTransitionType.truncate);
      unit = 'B';
    }
    return numStr + unit;
  }

  /// target 要转换的数字
  /// position 要保留的位数
  /// type 转化的类型
  String transitionNum(int postion,
      {NumTransitionType type = NumTransitionType.ceil}) {
    String t = toString();
    // 如果要保留的长度小于等于0，直接返回当前字符串
    if (postion < 0) {
      return t;
    }
    if (t.contains(".")) {
      String t1 = t.split(".").last;

      if (t1.length == postion) {
        return t;
      } else if (t1.length > postion) {
        if (type == NumTransitionType.truncate) {
          // 直接裁剪
          return t.substring(0, t.length - (t1.length - postion));
        } else {
          String s = t1.substring(postion, postion + 1);
          String reslut = toStringAsFixed(postion);
          if (int.parse(s) >= 5 || int.parse(s) == 0) {
            return reslut;
          } else {
            double r = double.parse(reslut);
            r = r + 1 / pow(10, postion);
            return r.transitionNum(postion, type: type);
          }
        }
      } else {
        // 不够位数的补相应个数的0,产品要求不要补0了
        // String t2 = "";
        // for (int i = 0; i < postion - t1.length; i++) {
        //   t2 += "0";
        // }
        // return t + t2;
        return numberCutZero(t);
      }
    } else {
      // 不含小数部分补点和相应的0
      String t3 = postion > 0 ? "." : "";
      for (int i = 0; i < postion; i++) {
        t3 += "0";
      }
      return t + t3;
    }
  }

  /// 去掉小数点后为0的尾数
  String numberCutZero(String data) {
    try {
      if (data == null) {
        return "";
      }
      if (!data.contains(".")) {
        return data;
      }
      RegExp regex = RegExp(r"([.]*0+)(?!.*\d)");
      String result = data.replaceAll(regex, "").replaceAll(",", "");

      return result;
    } catch (_) {
      return data;
    }
  }
}
