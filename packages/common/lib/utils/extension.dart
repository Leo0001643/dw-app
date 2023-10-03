/// dart自带的map和foreach默认不回传当前元素index 所以自己实现了一个
/// 在想使用的地方引入common.dart 即可
/// List.mapIndexed<String>(cb);

import 'package:flutter/material.dart';

extension ExtendedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  void forEachIndexed(void Function(E e, int i) f) {
    var i = 0;
    forEach((e) => f(e, i++));
  }
}

extension StringsExtension on String? {
  /// 解决超出预期的换行
  String get composing {
    return this == null ? "" : Characters(this ?? "").join('\u{200B}');
  }

  /// 转换成int
  int get toInt {
    if (this == '') return 0;
    if (this == 'null') return 0;

    try {
      return int.parse(this!);
    } catch (e) {
      return 0;
    }
  }

  /// 转换成double
  double get toDouble {
    if (this == '') return 0;
    if (this == 'null') return 0;
    try {
      return double.parse(this!);
    } catch (e) {
      return 0;
    }
  }

  /// 判断是不是空的
  bool get isEmptyOrNull {
    if (this == null) {
      return true;
    }
    if (this == "null") {
      return true;
    }
    return this!.isEmpty;
  }

  String get homeAssets {
    return "assets/images/home/$this";
  }

  String get tabAssets {
    return "assets/images/tabbar/$this";
  }

  String get activityAssets {
    return "assets/images/activity/$this";
  }

  String get loginAndRegisterAssets {
    return "assets/images/login_and_register/$this";
  }

  String get sportsTr {
    switch (this) {
      case "LIVE":
        return "滚球";
      case "TODAY":
        return "今日";
      case "EARLY":
        return "早盘";
      case "CHAMP":
        return "冠军";
      case "PARLAY":
        return "过关";
      case "SO":
        return "足球";
      case "FT":
        return "美式足球";
      case "BK":
        return "篮球";
      case "TN":
        return "网球";
      case "VL":
        return "排球";
      case "TT":
        return "乒乓球";
      case "CK":
        return "板球";
      case "DS":
        return "飞镖";
      case "BM":
        return "羽毛球";
      case "BS":
        return "棒球";
      case "ES":
        return "电子竞技";
      case "GF":
        return "高尔夫球";
      case "HD":
        return "手球";
      case "IH":
        return "冰球";
      case "FN":
        return "金融";
      case "BO":
        return "格斗";
      case "RU":
        return "橄榄球";
      case "SN":
        return "斯诺克";
      case "MR":
        return "赛车";
      case "LT":
        return "彩票";
      case "SP":
        return "特别项目";
      default:
        return this ?? "";
    }
  }
}
