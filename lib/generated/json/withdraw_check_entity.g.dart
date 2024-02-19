import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/withdraw_check_entity.dart';
import 'package:leisure_games/app/global.dart';

import 'package:leisure_games/app/intl/intr.dart';


WithdrawCheckEntity $WithdrawCheckEntityFromJson(Map<String, dynamic> json) {
  final WithdrawCheckEntity withdrawCheckEntity = WithdrawCheckEntity();
  final double? allNeedFee = jsonConvert.convert<double>(json['allNeedFee']);
  if (allNeedFee != null) {
    withdrawCheckEntity.allNeedFee = allNeedFee;
  }
  final double? normalFee = jsonConvert.convert<double>(json['normalFee']);
  if (normalFee != null) {
    withdrawCheckEntity.normalFee = normalFee;
  }
  final double? poromsFee = jsonConvert.convert<double>(json['poromsFee']);
  if (poromsFee != null) {
    withdrawCheckEntity.poromsFee = poromsFee;
  }
  final double? replyFee = jsonConvert.convert<double>(json['replyFee']);
  if (replyFee != null) {
    withdrawCheckEntity.replyFee = replyFee;
  }
  final int? replyTime = jsonConvert.convert<int>(json['replyTime']);
  if (replyTime != null) {
    withdrawCheckEntity.replyTime = replyTime;
  }
  final int? replyHours = jsonConvert.convert<int>(json['replyHours']);
  if (replyHours != null) {
    withdrawCheckEntity.replyHours = replyHours;
  }
  final int? timeFeeStatus = jsonConvert.convert<int>(json['timeFeeStatus']);
  if (timeFeeStatus != null) {
    withdrawCheckEntity.timeFeeStatus = timeFeeStatus;
  }
  final double? timeFeePercent = jsonConvert.convert<double>(
      json['timeFeePercent']);
  if (timeFeePercent != null) {
    withdrawCheckEntity.timeFeePercent = timeFeePercent;
  }
  final int? timeFeeBetNum = jsonConvert.convert<int>(json['timeFeeBetNum']);
  if (timeFeeBetNum != null) {
    withdrawCheckEntity.timeFeeBetNum = timeFeeBetNum;
  }
  final int? timeFeeHours = jsonConvert.convert<int>(json['timeFeeHours']);
  if (timeFeeHours != null) {
    withdrawCheckEntity.timeFeeHours = timeFeeHours;
  }
  final double? totalValidamount = jsonConvert.convert<double>(
      json['totalValidamount']);
  if (totalValidamount != null) {
    withdrawCheckEntity.totalValidamount = totalValidamount;
  }
  final int? takeMoneyMax = jsonConvert.convert<int>(json['takeMoneyMax']);
  if (takeMoneyMax != null) {
    withdrawCheckEntity.takeMoneyMax = takeMoneyMax;
  }
  final int? takeMoneyMin = jsonConvert.convert<int>(json['takeMoneyMin']);
  if (takeMoneyMin != null) {
    withdrawCheckEntity.takeMoneyMin = takeMoneyMin;
  }
  final String? addTime = jsonConvert.convert<String>(json['addTime']);
  if (addTime != null) {
    withdrawCheckEntity.addTime = addTime;
  }
  final dynamic checkType = json['checkType'];
  if (checkType != null) {
    withdrawCheckEntity.checkType = checkType;
  }
  return withdrawCheckEntity;
}

Map<String, dynamic> $WithdrawCheckEntityToJson(WithdrawCheckEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['allNeedFee'] = entity.allNeedFee;
  data['normalFee'] = entity.normalFee;
  data['poromsFee'] = entity.poromsFee;
  data['replyFee'] = entity.replyFee;
  data['replyTime'] = entity.replyTime;
  data['replyHours'] = entity.replyHours;
  data['timeFeeStatus'] = entity.timeFeeStatus;
  data['timeFeePercent'] = entity.timeFeePercent;
  data['timeFeeBetNum'] = entity.timeFeeBetNum;
  data['timeFeeHours'] = entity.timeFeeHours;
  data['totalValidamount'] = entity.totalValidamount;
  data['takeMoneyMax'] = entity.takeMoneyMax;
  data['takeMoneyMin'] = entity.takeMoneyMin;
  data['addTime'] = entity.addTime;
  data['checkType'] = entity.checkType;
  return data;
}

extension WithdrawCheckEntityExtension on WithdrawCheckEntity {
  WithdrawCheckEntity copyWith({
    double? allNeedFee,
    double? normalFee,
    double? poromsFee,
    double? replyFee,
    int? replyTime,
    int? replyHours,
    int? timeFeeStatus,
    double? timeFeePercent,
    int? timeFeeBetNum,
    int? timeFeeHours,
    double? totalValidamount,
    int? takeMoneyMax,
    int? takeMoneyMin,
    String? addTime,
    dynamic checkType,
  }) {
    return WithdrawCheckEntity()
      ..allNeedFee = allNeedFee ?? this.allNeedFee
      ..normalFee = normalFee ?? this.normalFee
      ..poromsFee = poromsFee ?? this.poromsFee
      ..replyFee = replyFee ?? this.replyFee
      ..replyTime = replyTime ?? this.replyTime
      ..replyHours = replyHours ?? this.replyHours
      ..timeFeeStatus = timeFeeStatus ?? this.timeFeeStatus
      ..timeFeePercent = timeFeePercent ?? this.timeFeePercent
      ..timeFeeBetNum = timeFeeBetNum ?? this.timeFeeBetNum
      ..timeFeeHours = timeFeeHours ?? this.timeFeeHours
      ..totalValidamount = totalValidamount ?? this.totalValidamount
      ..takeMoneyMax = takeMoneyMax ?? this.takeMoneyMax
      ..takeMoneyMin = takeMoneyMin ?? this.takeMoneyMin
      ..addTime = addTime ?? this.addTime
      ..checkType = checkType ?? this.checkType;
  }
}