// value 值  decimal 保留多少为小数点
import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../common.dart';

String decimalString(dynamic value, [int decimal = 2]) {
  try {
    double.parse('$value');
  } catch (_) {
    return '--';
  }
  final val = '$value';
  if (val.contains('.')) {
    var arr = val.split('.');
    var number = arr[0];
    var decimals = arr[1];

    return '$number.' +
        (decimals.length >= decimal
            ? decimals.split('').take(decimal).join()
            : decimals + List.filled(decimal - decimals.length, 0).join(''));
  } else {
    return val + '.' + List.filled(decimal, 0).join('');
  }
}

String onlineChannelInfoNumber(OnlineProductChannel item, int index) {
  String channelIndex = '通道' + numberToLocaleString(index);
  return channelIndex;
}

String onlineChannelInfoLimit(OnlineProductChannel item, int index) {
  String currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol!;
  int min = double.parse(item.paymin!).round();
  int max = double.parse(item.paymax!).round();
  return '$currencySymbol$min～$currencySymbol$max';
}

String onlineChannelInfo(OnlineProductChannel item, int index) {
  String channelIndex = '通道' + numberToLocaleString(index);
  String currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol!;
  int min = double.parse(item.paymin!).round();
  int max = double.parse(item.paymax!).round();

  return '$channelIndex（单笔限额：$currencySymbol$min～$currencySymbol$max）';
}

String transferLimit(TransferProduct item) {
  String currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol!;
  int min = double.parse(item.paymin!).round();
  int max = double.parse(item.paymax!).round();

  return '$currencySymbol$min～$currencySymbol$max';
}

String transferLimitZ01(TransferProduct item) {
  String currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol!;
  String min = double.tryParse(item.paymin!)!.toStringAsFixed(2);
  String max = double.tryParse(item.paymax!)!.toStringAsFixed(2);

  return '$currencySymbol$min～$currencySymbol$max';
}

String numberToLocaleString(int number) {
  if (number > 99) {
    return number.toString();
  }

  if (Get.locale?.languageCode == 'zh') {
    if (number > 10) {
      List<String> numArr = number.toString().split('');
      String m = numArr[0];
      String ten = mapCN[int.parse(m)]!;
      String digit =
          int.parse(numArr[1]) > 0 ? mapCN[int.parse(numArr[1])]! : '';
      return '$ten${mapCN[0]}$digit';
    } else {
      return mapCN[number]!;
    }
  }

  return number.toString();
}

Map<int, String> mapCN = {
  0: '零',
  1: '一',
  2: '二',
  3: '三',
  4: '四',
  5: '五',
  6: '六',
  7: '七',
  8: '八',
  9: '九',
  10: '十',
};

////订单编号展示规则：
//
// 小于等于16位，展示所有文本
// 大于16位，展示前10位和后六位字符，中间用...表示
//
// 例如：
// 订单编号：0123456789......2345

String orderNumberFormatter(String? from) {
  if (from == null || from.isEmpty) return '';
  if (from.length <= 16) return from;
  String pre = from.substring(0, 10);
  String suffix = from.substring(from.length - 6, from.length);
  return pre + '.....' + suffix;
}

String doubleStringSubstringInter(String? from) {
  if (from == null || from.isEmpty) return '0';
  if (from.contains('.')) {
    int index = from.indexOf('.');
    return from.substring(0, index);
  }
  return '0';
}

String doubleStringSubstringDecimal(String? from) {
  if (from == null || from.isEmpty) return '00';
  if (from.contains('.')) {
    int index = from.indexOf('.');
    return from.substring(index);
  }
  return '00';
}

///保留2位，如果为0，返回0
///保留2位，如果为10.00，返回10.00
String to2fixNumber(String? title) {
  if (title == null || title.isEmpty) return '0';
  double d = double.tryParse(title) ?? 0;
  if (d == 0) {
    return '0';
  }
  String result = decimalString(title);
  return result;
}

///保留2位，如果为0，返回0
///保留2位，如果为10.00，返回10.00
String to2fixNumberByNumber(double? title) {
  if (title == null) return '0';
  if (title == 0) {
    return '0';
  }
  String result = decimalString(title);
  return result;
}
