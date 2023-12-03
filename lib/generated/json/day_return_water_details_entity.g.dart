import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/day_return_water_details_entity.dart';

DayReturnWaterDetailsEntity $DayReturnWaterDetailsEntityFromJson(
    Map<String, dynamic> json) {
  final DayReturnWaterDetailsEntity dayReturnWaterDetailsEntity = DayReturnWaterDetailsEntity();
  final String? total = jsonConvert.convert<String>(json['total']);
  if (total != null) {
    dayReturnWaterDetailsEntity.total = total;
  }
  final String? betTermCount = jsonConvert.convert<String>(
      json['betTermCount']);
  if (betTermCount != null) {
    dayReturnWaterDetailsEntity.betTermCount = betTermCount;
  }
  final double? betMoney = jsonConvert.convert<double>(json['betMoney']);
  if (betMoney != null) {
    dayReturnWaterDetailsEntity.betMoney = betMoney;
  }
  final String? lossMoney = jsonConvert.convert<String>(json['lossMoney']);
  if (lossMoney != null) {
    dayReturnWaterDetailsEntity.lossMoney = lossMoney;
  }
  final String? lossMoneyBonus = jsonConvert.convert<String>(
      json['lossMoneyBonus']);
  if (lossMoneyBonus != null) {
    dayReturnWaterDetailsEntity.lossMoneyBonus = lossMoneyBonus;
  }
  final String? combinBetMoney = jsonConvert.convert<String>(
      json['combinBetMoney']);
  if (combinBetMoney != null) {
    dayReturnWaterDetailsEntity.combinBetMoney = combinBetMoney;
  }
  final String? basicBetMoney = jsonConvert.convert<String>(
      json['basicBetMoney']);
  if (basicBetMoney != null) {
    dayReturnWaterDetailsEntity.basicBetMoney = basicBetMoney;
  }
  final String? combinBetRatio = jsonConvert.convert<String>(
      json['combinBetRatio']);
  if (combinBetRatio != null) {
    dayReturnWaterDetailsEntity.combinBetRatio = combinBetRatio;
  }
  final String? basicBetRatio = jsonConvert.convert<String>(
      json['basicBetRatio']);
  if (basicBetRatio != null) {
    dayReturnWaterDetailsEntity.basicBetRatio = basicBetRatio;
  }
  final List<DayReturnWaterDetailsRecord>? record = (json['record'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<DayReturnWaterDetailsRecord>(
          e) as DayReturnWaterDetailsRecord).toList();
  if (record != null) {
    dayReturnWaterDetailsEntity.record = record;
  }
  return dayReturnWaterDetailsEntity;
}

Map<String, dynamic> $DayReturnWaterDetailsEntityToJson(
    DayReturnWaterDetailsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['total'] = entity.total;
  data['betTermCount'] = entity.betTermCount;
  data['betMoney'] = entity.betMoney;
  data['lossMoney'] = entity.lossMoney;
  data['lossMoneyBonus'] = entity.lossMoneyBonus;
  data['combinBetMoney'] = entity.combinBetMoney;
  data['basicBetMoney'] = entity.basicBetMoney;
  data['combinBetRatio'] = entity.combinBetRatio;
  data['basicBetRatio'] = entity.basicBetRatio;
  data['record'] = entity.record?.map((v) => v.toJson()).toList();
  return data;
}

extension DayReturnWaterDetailsEntityExtension on DayReturnWaterDetailsEntity {
  DayReturnWaterDetailsEntity copyWith({
    String? total,
    String? betTermCount,
    double? betMoney,
    String? lossMoney,
    String? lossMoneyBonus,
    String? combinBetMoney,
    String? basicBetMoney,
    String? combinBetRatio,
    String? basicBetRatio,
    List<DayReturnWaterDetailsRecord>? record,
  }) {
    return DayReturnWaterDetailsEntity()
      ..total = total ?? this.total
      ..betTermCount = betTermCount ?? this.betTermCount
      ..betMoney = betMoney ?? this.betMoney
      ..lossMoney = lossMoney ?? this.lossMoney
      ..lossMoneyBonus = lossMoneyBonus ?? this.lossMoneyBonus
      ..combinBetMoney = combinBetMoney ?? this.combinBetMoney
      ..basicBetMoney = basicBetMoney ?? this.basicBetMoney
      ..combinBetRatio = combinBetRatio ?? this.combinBetRatio
      ..basicBetRatio = basicBetRatio ?? this.basicBetRatio
      ..record = record ?? this.record;
  }
}

DayReturnWaterDetailsRecord $DayReturnWaterDetailsRecordFromJson(
    Map<String, dynamic> json) {
  final DayReturnWaterDetailsRecord dayReturnWaterDetailsRecord = DayReturnWaterDetailsRecord();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    dayReturnWaterDetailsRecord.id = id;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    dayReturnWaterDetailsRecord.date = date;
  }
  final String? validBetMoney = jsonConvert.convert<String>(
      json['validBetMoney']);
  if (validBetMoney != null) {
    dayReturnWaterDetailsRecord.validBetMoney = validBetMoney;
  }
  final double? lossMoney = jsonConvert.convert<double>(json['lossMoney']);
  if (lossMoney != null) {
    dayReturnWaterDetailsRecord.lossMoney = lossMoney;
  }
  final String? lossMoneyBonus = jsonConvert.convert<String>(
      json['lossMoneyBonus']);
  if (lossMoneyBonus != null) {
    dayReturnWaterDetailsRecord.lossMoneyBonus = lossMoneyBonus;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    dayReturnWaterDetailsRecord.state = state;
  }
  final double? combinBetRatio = jsonConvert.convert<double>(
      json['combinBetRatio']);
  if (combinBetRatio != null) {
    dayReturnWaterDetailsRecord.combinBetRatio = combinBetRatio;
  }
  return dayReturnWaterDetailsRecord;
}

Map<String, dynamic> $DayReturnWaterDetailsRecordToJson(
    DayReturnWaterDetailsRecord entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['date'] = entity.date;
  data['validBetMoney'] = entity.validBetMoney;
  data['lossMoney'] = entity.lossMoney;
  data['lossMoneyBonus'] = entity.lossMoneyBonus;
  data['state'] = entity.state;
  data['combinBetRatio'] = entity.combinBetRatio;
  return data;
}

extension DayReturnWaterDetailsRecordExtension on DayReturnWaterDetailsRecord {
  DayReturnWaterDetailsRecord copyWith({
    int? id,
    String? date,
    String? validBetMoney,
    double? lossMoney,
    String? lossMoneyBonus,
    String? state,
    double? combinBetRatio,
  }) {
    return DayReturnWaterDetailsRecord()
      ..id = id ?? this.id
      ..date = date ?? this.date
      ..validBetMoney = validBetMoney ?? this.validBetMoney
      ..lossMoney = lossMoney ?? this.lossMoney
      ..lossMoneyBonus = lossMoneyBonus ?? this.lossMoneyBonus
      ..state = state ?? this.state
      ..combinBetRatio = combinBetRatio ?? this.combinBetRatio;
  }
}