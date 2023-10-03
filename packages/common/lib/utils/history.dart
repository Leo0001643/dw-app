import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../core/app_env.dart';
import '../data/model/entities/record/status_color_entity.dart';

/// 时间戳转字符串 默认格式为 yyyy/mm/dd
/// 格式请看下面链接
/// https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html#:~:text=DateFormat%20is%20for%20formatting%20and,name%2C%20field%20order%2C%20etc.
String getStatuString(int type) {
  Map<int, String> statusMap = {
    1: 'user.center.no.check'.tr,
    2: 'user.center.fail.check'.tr,
    3: 'user.center.pass.check'.tr,
    4: 'user.center.wait.send'.tr,
    5: 'user.center.has.send'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

String getApp03StatuString(int type) {
  Map<int, String> statusMap = {
    1: 'user.center.no.check'.tr,
    2: 'user.center.fail'.tr,
    3: 'user.center.pass.check'.tr,
    4: 'user.center.wait.send'.tr,
    5: 'user.center.has.send'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

Color getStatusColor(int state) {
  Map<int, Color> statusMap = {
    1: Color(0xFFF0BE5C),
    2: Color(0xffff0000),
    3: Color(0xff008000),
    4: Color(0xFFF0BE5C),
    5: Color(0xff008000),
  };
  String siteTag = AppEnv.config.siteTag ?? "h09";
  //客服说这里写死，G87站点  特殊处理
  if (siteTag == "a02" || siteTag == "g87") {
    statusMap = {
      1: Color(0xFFFF8000),
      2: Color(0xffff0000),
      3: Color(0xff00ff00),
      4: Color(0xFFF0BE5C),
      5: Color(0xff008000),
    };
  }

  return statusMap.containsKey(state) ? statusMap[state]! : Color(0xff008000);
}

//简短文字版本
String getDiscountStatuString(int type) {
  Map<int, String> statusMap = {
    1: 'user.center.no.check'.tr,
    2: '失败'.tr,
    3: '通过'.tr,
    4: 'user.center.wait.send'.tr,
    5: 'user.center.has.send'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

///简略版的优惠类型 判断yh_type
String getYhTypeString(int type) {
  Map<int, String> statusMap = {
    0: 'app01.user.center.yh.ypc'.tr,
    1: 'app01.user.center.yh.xtyh'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

///全面详情的优惠类型 判断type
String getDetailYhTypeString(String type) {
  Map<String, String> statusMap = {
    '0': 'yh_type_sign'.tr,
    '1': 'yh_type_recharge'.tr,
    '2': 'yh_type_transfer'.tr,
    '3': 'yh_type_transfer_online'.tr,
    '4': 'yh_type_register'.tr,
    '5': 'yh_type_red'.tr,
    '6': 'yh_type_apply'.tr,
    '7': 'yh_type_text'.tr,
    '8': 'yh_type_system'.tr,
    '9': 'yh_type_wheel'.tr,
    '11': 'yh_type_da_ma'.tr,
    '13': 'yh_type_wheel_new'.tr,
    '18': 'yh_type_sign_daily'.tr,
    '19': 'yh_type_red_new'.tr,
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

String getTypeString(int type) {
  Map<int, String> statusMap = {
    1: 'user.center.xtcz'.tr,
    2: 'user.center.zzhk'.tr,
    3: 'user.center.xscz'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

//模板的一些字段改了
String getCommonTypeString(int type) {
  Map<int, String> statusMap = {
    1: '系统入款',
    2: 'user.center.zzhk'.tr,
    3: 'user.center.xscz'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

String getWidthdrawTypeString(int type) {
  Map<int, String> statusMap = {
    1: 'user.center.hysq'.tr,
    2: 'user.center.xtck'.tr,
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

String getWidthdrawStatuString(int type) {
  Map<int, String> statusMap = {
    1: 'user.center.no.pay'.tr,
    3: 'user.center.success'.tr,
    5: 'user.center.success'.tr,
    2: 'user.center.fail'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

String getRechargeStatuString(int type) {
  Map<int, String> statusMap = {
    1: 'user.center.no.pay'.tr,
    2: 'user.center.fail'.tr,
    3: 'user.center.success'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

Color getRechargeStatuColor(int type) {
  Map<int, Color> statusMap = {
    1: Color(0xFFF0BE5C),
    2: Color(0xffff0000),
    3: Color(0xff228F21),
  };
  return statusMap.containsKey(type) ? statusMap[type]! : Color(0xff228F21);
}

String getBetStatuString(int type) {
  Map<int, String> statusMap = {
    1: 'user.center.no.jiesuan'.tr,
    2: 'user.center.jiesuan'.tr,
    3: 'user.center.chedan'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

String getYouhuiStatuString(int type) {
  Map<int, String> statusMap = {
    1: 'deposit'.tr,
    2: 'user.center.youhui'.tr,
    3: 'user.center.other'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

String getReportStatuString(int type) {
  Map<int, String> statusMap = {
    0: 'user.center.report.0'.tr,
    1: 'user.center.report.1'.tr,
    2: 'user.center.report.2'.tr,
    3: 'user.center.report.3'.tr,
    4: 'user.center.report.4'.tr,
    5: 'user.center.report.5'.tr,
    6: 'user.center.report.6'.tr,
    11: 'user.center.report.11'.tr,
    12: 'user.center.report.12'.tr,
    13: 'user.center.report.13'.tr,
    14: 'user.center.report.14'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

//g87要求，额度转换区分是否是会员提现冻结
String getReportStatusStringWith14(int type, String? ptName) {
  if (ptName == '会员提现' && type == 14) {
    return '申请提现';
  }
  return getReportStatuString(type);
}

//状态 3,5-成功 2-失败 1-正在申请
String getWithdrawStatuString(int type) {
  Map<int, String> statusMap = {
    1: 'user.center.withdraw.on.apply'.tr,
    2: 'user.center.fail'.tr,
    3: 'user.center.success'.tr,
    5: 'user.center.success'.tr,
    6: 'user.center.fail'.tr
  };
  return statusMap.containsKey(type) ? statusMap[type]! : '--';
}

Color getBackStatusColor(int state) {
  Map<int, Color> statusMap = {
    1: Colors.green[900]!,
    2: Color(0xfff24942),
    3: const Color(0xff000000),
    4: const Color(0xff000000),
    5: const Color(0xff000000),
    6: Color(0xFFF0BE5C),
    7: Color(0xff008000)
  };
  return statusMap.containsKey(state) ? statusMap[state]! : Color(0xff008000);
}

String getBackStatuString(int type) {
  Map<int, String> statusMap = {
    1: 'user.center.back.has.water'.tr,
    2: 'user.center.back.cancle.water'.tr,
    3: 'user.center.back.no.water'.tr,
    4: 'user.center.back.origin.total'.tr,
    5: 'user.center.back.fail'.tr,
    6: 'user.center.vip.no.get'.tr,
    7: 'user.center.vip.has.get'.tr
  };
  return statusMap.containsKey(type)
      ? statusMap[type]!
      : 'user.center.other'.tr;
}

String getTenLimitsString(String elStr) {
  if (elStr == null) {
    return "";
  }
  if (elStr.length < 20) {
    return elStr;
  }

  return elStr.substring(0, 20) + "…";
}

String getTenLimitsStringBylength(String elStr, int length) {
  if (elStr == null) {
    return "";
  }
  if (elStr.length < length) {
    return elStr;
  }

  return elStr.substring(0, length) + "…";
}

class SelectEntity {
  String? name;
  String? value;
  String? type;
  SelectEntity({this.name, this.value, this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['value'] = value;
    data['type'] = type;
    return data;
  }
}

String getLastDate() {
  var now = new DateTime.now();
  return now.add(new Duration(days: -1)).toString().substring(0, 10);
}

String getLastSevenDate() {
  var now = new DateTime.now();
  return now.add(new Duration(days: -7)).toString().substring(0, 10);
}

String getLastThirtyDate() {
  var now = new DateTime.now();
  return now.add(new Duration(days: -30)).toString().substring(0, 10);
}

String getCurMonthDate() {
  return DateFormat('yyyy-MM', "zh_CN").format(DateTime.now()) + "-01";
}

String getLastMonthDateStart() {
  var formater = DateFormat('yyyy-MM-dd');
  String today = formater.format(DateTime.now()); //2021.8.24   获取今天的日期
  String month = today.substring(5, 7); //08  这个月
  int nowyear = DateTime.now().year; //今年
  return formater.format(DateTime(nowyear, int.parse(month) - 1, 01));
}

String getLastMonthDateEnd() {
  var formater = DateFormat('yyyy-MM-dd');
  String today = formater.format(DateTime.now()); //2021.8.24   获取今天的日期
  String month = today.substring(5, 7); //08  这个月
  int nowyear = DateTime.now().year; //今年
  return formater.format(DateTime(nowyear, int.parse(month), 0));
}

String getEndTime() {
  DateTime currentTime = DateTime.now();
  String dateStr = currentTime.toString().substring(0, 19);
  return dateStr;
}

String getStartTime() {
  DateTime currentTime = DateTime.now();
  String dateStr = currentTime.toString().substring(0, 10);
  return dateStr + " 00:00:00";
}

String getEndDate() {
  DateTime currentTime = DateTime.now();
  String dateStr = currentTime.toString().substring(0, 10);
  return dateStr;
}

String getLimitString(String dataStr, int limitInt) {
  if (dataStr.isEmpty) {
    return "";
  }
  if (dataStr.length < limitInt) {
    return dataStr;
  }
  return dataStr.substring(0, limitInt - 2) + "…";
}

String geSpaceString(String valueStr) {
  if (valueStr.isEmpty) {
    return "--";
  }
  if (valueStr == "0") {
    return "--";
  }
  return valueStr;
}

String getStartDate() {
  DateTime currentTime = DateTime.now();
  String dateStr = currentTime.toString().substring(0, 10);
  return dateStr;
}

List<SelectEntity> getDateListData() {
  List<SelectEntity> list = RxList();
  SelectEntity entity1 =
      SelectEntity(name: "user.center.report.curday".tr, value: "1");
  SelectEntity entity2 =
      SelectEntity(name: "user.center.report.yesterday".tr, value: "2");
  SelectEntity entity3 =
      SelectEntity(name: "user.center.report.sevenday".tr, value: "3");
  SelectEntity entity4 =
      SelectEntity(name: "user.center.report.cur.month".tr, value: "4");
  SelectEntity entity5 =
      SelectEntity(name: "user.center.report.last.month".tr, value: "5");
  list.add(entity1);
  list.add(entity2);
  list.add(entity3);
  list.add(entity4);
  list.add(entity5);
  return list;
}

List<SelectEntity> getBetSelectList() {
  List<SelectEntity> list = RxList();
  SelectEntity entity1 = SelectEntity(name: "game.type.1".tr, type: "1");
  SelectEntity entity2 = SelectEntity(name: "game.type.2".tr, type: "2");
  SelectEntity entity3 = SelectEntity(name: "game.type.3".tr, type: "3");
  SelectEntity entity4 = SelectEntity(name: "game.type.4".tr, type: "4");
  SelectEntity entity5 = SelectEntity(name: "game.type.5".tr, type: "5");
  SelectEntity entity6 = SelectEntity(name: "game.type.6".tr, type: "6");
  SelectEntity entity7 = SelectEntity(name: "game.type.7".tr, type: "7");

  list.add(entity1);
  list.add(entity2);
  list.add(entity3);
  list.add(entity4);
  list.add(entity5);
  list.add(entity6);
  list.add(entity7);
  return list;
}

List<SelectEntity> getB33BetBackSelectList() {
  List<SelectEntity> list = RxList();
  SelectEntity entity0 =
      SelectEntity(name: "user.center.report.0".tr, type: "10");
  SelectEntity entity1 = SelectEntity(name: "game.type.1".tr, type: "1");
  SelectEntity entity2 = SelectEntity(name: "game.type.2".tr, type: "2");
  SelectEntity entity3 = SelectEntity(name: "game.type.3".tr, type: "3");
  SelectEntity entity4 = SelectEntity(name: "game.type.4".tr, type: "4");
  SelectEntity entity5 = SelectEntity(name: "game.type.5".tr, type: "5");
  SelectEntity entity6 = SelectEntity(name: "game.type.6".tr, type: "6");
  SelectEntity entity7 = SelectEntity(name: "game.type.7".tr, type: "7");

  list.add(entity1);
  list.add(entity2);
  list.add(entity3);
  list.add(entity4);
  list.add(entity5);
  list.add(entity6);
  list.add(entity7);
  return list;
}

List<SelectEntity> getBetB33SelectList() {
  List<SelectEntity> list = RxList();

  SelectEntity entity1 = SelectEntity(name: "game.type.1".tr, type: "1");
  SelectEntity entity2 = SelectEntity(name: "game.type.2".tr, type: "2");
  SelectEntity entity3 = SelectEntity(name: "game.type.3".tr, type: "3");
  SelectEntity entity4 = SelectEntity(name: "game.type.4".tr, type: "4");
  SelectEntity entity5 = SelectEntity(name: "game.type.5".tr, type: "5");
  SelectEntity entity6 = SelectEntity(name: "game.type.6".tr, type: "6");
  SelectEntity entity7 = SelectEntity(name: "game.type.7".tr, type: "7");
  SelectEntity entity8 =
      SelectEntity(name: "user.center.report.0".tr, type: "");
  list.add(entity1);
  list.add(entity2);
  list.add(entity3);
  list.add(entity4);
  list.add(entity5);
  list.add(entity6);
  list.add(entity7);
  list.add(entity8);
  return list;
}

List<SelectEntity> getZ01BetSelectList() {
  List<SelectEntity> list = RxList();

  SelectEntity entity1 = SelectEntity(name: "game.type.1".tr, type: "1");
  SelectEntity entity2 = SelectEntity(name: "game.type.2".tr, type: "2");
  SelectEntity entity3 = SelectEntity(name: "game.type.3".tr, type: "3");
  SelectEntity entity4 = SelectEntity(name: "game.type.4".tr, type: "4");
  SelectEntity entity5 = SelectEntity(name: "game.type.5".tr, type: "5");
  SelectEntity entity6 = SelectEntity(name: "game.type.6".tr, type: "6");
  SelectEntity entity7 = SelectEntity(name: "game.type.7".tr, type: "7");
  SelectEntity entity8 =
      SelectEntity(name: "user.center.report.0".tr, type: "");
  list.add(entity8);
  list.add(entity1);
  list.add(entity2);
  list.add(entity3);
  list.add(entity4);
  list.add(entity5);
  list.add(entity6);
  list.add(entity7);
  return list;
}

List<SelectEntity> getReportOutListData() {
  List<SelectEntity> list = RxList();
  SelectEntity entity7 =
      SelectEntity(name: "user.center.report.6".tr, value: "6");
  SelectEntity entity8 =
      SelectEntity(name: "user.center.report.11".tr, value: "11");
  SelectEntity entity9 =
      SelectEntity(name: "user.center.report.12".tr, value: "12");
  SelectEntity entity10 =
      SelectEntity(name: "user.center.report.13".tr, value: "13");
  SelectEntity entity11 =
      SelectEntity(name: "user.center.report.14".tr, value: "14");
  list.add(entity7);
  list.add(entity8);
  list.add(entity9);
  list.add(entity10);
  list.add(entity11);
  return list;
}

List<SelectEntity> getReportListData() {
  List<SelectEntity> list = RxList();
  SelectEntity entity1 =
      SelectEntity(name: "user.center.report.0".tr, value: "");
  SelectEntity entity2 =
      SelectEntity(name: "user.center.report.1".tr, value: "1");
  SelectEntity entity3 =
      SelectEntity(name: "user.center.report.2".tr, value: "2");
  SelectEntity entity4 =
      SelectEntity(name: "user.center.report.3".tr, value: "3");
  SelectEntity entity5 =
      SelectEntity(name: "user.center.report.4".tr, value: "4");
  SelectEntity entity6 =
      SelectEntity(name: "user.center.report.5".tr, value: "5");
  SelectEntity entity7 =
      SelectEntity(name: "user.center.report.6".tr, value: "6");
  SelectEntity entity8 =
      SelectEntity(name: "user.center.report.11".tr, value: "11");
  SelectEntity entity9 =
      SelectEntity(name: "user.center.report.12".tr, value: "12");
  SelectEntity entity10 =
      SelectEntity(name: "user.center.report.13".tr, value: "13");
  SelectEntity entity11 =
      SelectEntity(name: "user.center.report.14".tr, value: "14");

  // SelectEntity entity11 =
  // SelectEntity(name: "user.center.report.14".tr, value: "14");
  list.add(entity1);
  list.add(entity2);
  list.add(entity3);
  list.add(entity4);
  list.add(entity5);
  list.add(entity6);
  list.add(entity7);
  list.add(entity8);
  list.add(entity9);
  list.add(entity10);
  list.add(entity11);
  // list.add(entity11);
  return list;
}

List<SelectEntity> getRechargeListData() {
  List<SelectEntity> list = RxList();
  SelectEntity entity1 =
      SelectEntity(name: "user.center.status.all".tr, value: "");
  SelectEntity entity2 =
      SelectEntity(name: "user.center.no.pay".tr, value: "1");
  SelectEntity entity3 =
      SelectEntity(name: 'user.center.pay_success'.tr, value: "3");
  SelectEntity entity4 =
      SelectEntity(name: 'user.center.pay_fail'.tr, value: "2");
  list.add(entity1);
  list.add(entity3);
  list.add(entity2);
  list.add(entity4);
  return list;
}

List<SelectEntity> getWithdrawListData() {
  List<SelectEntity> list = RxList();
  SelectEntity entity1 =
      SelectEntity(name: "user.center.status.all".tr, value: "0");
  SelectEntity entity2 =
      SelectEntity(name: "user.center.no.pay".tr, value: "1");
  SelectEntity entity3 =
      SelectEntity(name: 'user.center.success'.tr, value: "3");
  SelectEntity entity4 = SelectEntity(name: 'user.center.fail'.tr, value: "2");
  list.add(entity1);
  list.add(entity2);
  list.add(entity3);
  list.add(entity4);
  return list;
}

List<SelectEntity> getRebateStateListData() {
  List<SelectEntity> list = RxList();
  SelectEntity entity1 =
      SelectEntity(name: "user.center.status.all".tr, value: "0");
  SelectEntity entity2 =
      SelectEntity(name: "user.center.back.has.water".tr, value: "1");
  SelectEntity entity3 =
      SelectEntity(name: 'user.center.back.available'.tr, value: "6");
  SelectEntity entity4 =
      SelectEntity(name: 'user.center.back.received'.tr, value: "7");
  list.add(entity1);
  list.add(entity2);
  list.add(entity3);
  list.add(entity4);
  return list;
}

List<String> get recordsDateList {
  return [
    "user.center.report.curday".tr,
    "user.center.report.yesterday".tr,
    "user.center.report.sevenday".tr,
    "近30日",
    "自定义"
  ];
}

///模板记录数据
///特殊扣款 额度转换 是负数
List<SelectEntity> get getCommonReportListData {
  List<SelectEntity> list = RxList();
  SelectEntity entity0 = SelectEntity(name: "存款", value: "1");
  SelectEntity entity1 = SelectEntity(name: "取款", value: "11");
  SelectEntity entity2 = SelectEntity(name: "优惠", value: "2");
  SelectEntity entity3 = SelectEntity(name: "返水", value: "3");
  SelectEntity entity4 = SelectEntity(name: "特殊入款", value: "5");
  SelectEntity entity5 = SelectEntity(name: "特殊扣款", value: "13");
  SelectEntity entity6 = SelectEntity(name: "转入", value: "4");
  SelectEntity entity7 = SelectEntity(name: "转出", value: "12");
  SelectEntity entity8 = SelectEntity(name: "解冻", value: "6");
  SelectEntity entity9 = SelectEntity(name: "额度转换", value: "14");

  list.add(entity0);
  list.add(entity1);
  list.add(entity2);
  list.add(entity3);
  list.add(entity4);
  list.add(entity5);
  list.add(entity6);
  list.add(entity7);
  list.add(entity8);
  list.add(entity9);
  return list;
}

///模板记录数据 -- 提现
///根据提现type，判断提现收款方式
getCommonWithdrawCardType(int? type) {
  Map<int, String> typeMap = {
    1: '银行卡提现',
    2: '区块链提现',
    4: '电子提现',
    10: '普通提现',
    11: '代付提现'
  };
  return typeMap.containsKey(type) ? typeMap[type]! : 'user.center.other'.tr;
}

///模板记录数据 -- 提现
///根据提现status，判断提现收款方式
StatusColorEntity getCommonWithdrawStatus(int? state) {
  if (state == 1 || state == 4) {
    return StatusColorEntity(
      '申请中',
      const Color(0xFF0047FF),
    );
  } else if (state == 2 || state == 6) {
    return StatusColorEntity(
      '支付失败',
      const Color(0xFFbb1100),
    );
  } else if (state == 3 || state == 5) {
    return StatusColorEntity(
      '支付成功',
      const Color(0xFF00a010),
    );
  }
  return StatusColorEntity(
    '其他',
    const Color(0xFF0047ff),
  );
}

///根据游戏type，获取游戏分类名字
getCommonGameTypeTitle(int? type) {
  if (type == null) return '';
  if (type < 1 || type > 7) {
    return '';
  }
  Map map = {
    1: "game.type.1".tr,
    2: "game.type.2".tr,
    3: "game.type.3".tr,
    4: "game.type.4".tr,
    5: "game.type.5".tr,
    6: "game.type.6".tr,
    7: "game.type.7".tr,
  };
  return map[type];
}

///游戏投注状态
StatusColorEntity getCommonBetState(int? type) {
  // 注单状态 1-未结算 2-已结算 3-撤单 4-其他
  Map map = {
    1: StatusColorEntity('user.center.no.jiesuan'.tr, const Color(0xFFBB1100)),
    2: StatusColorEntity('user.center.jiesuan'.tr, const Color(0xFF00A010)),
    3: StatusColorEntity('取消', const Color(0xFF0047FF)),
    4: StatusColorEntity('其他', const Color(0xFF969696)),
  };
  if (type == null) return map[4];
  if (map.containsKey(type)) {
    return map[type];
  }
  return map[4];
}

///游戏投注分类
List<SelectEntity> get getCommonGameTypesData {
  List<SelectEntity> list = [];
  SelectEntity entity1 = SelectEntity(name: "视讯", value: "1");
  SelectEntity entity2 = SelectEntity(name: "电子", value: "2");
  SelectEntity entity3 = SelectEntity(name: "彩票", value: "3");
  SelectEntity entity4 = SelectEntity(name: "体育", value: "4");
  SelectEntity entity5 = SelectEntity(name: "捕鱼", value: "5");
  SelectEntity entity6 = SelectEntity(name: "棋牌", value: "6");
  SelectEntity entity7 = SelectEntity(name: "电竞", value: "7");
  list.add(entity1);
  list.add(entity2);
  list.add(entity3);
  list.add(entity4);
  list.add(entity5);
  list.add(entity6);
  list.add(entity7);
  return list;
}
