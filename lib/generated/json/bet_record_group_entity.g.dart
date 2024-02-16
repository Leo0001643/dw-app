import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/bet_record_group_entity.dart';

BetRecordGroupEntity $BetRecordGroupEntityFromJson(Map<String, dynamic> json) {
  final BetRecordGroupEntity betRecordGroupEntity = BetRecordGroupEntity();
  final double? betAmountTotal = jsonConvert.convert<double>(
      json['betAmountTotal']);
  if (betAmountTotal != null) {
    betRecordGroupEntity.betAmountTotal = betAmountTotal;
  }
  final String? validAmountTotal = jsonConvert.convert<String>(
      json['validAmountTotal']);
  if (validAmountTotal != null) {
    betRecordGroupEntity.validAmountTotal = validAmountTotal;
  }
  final double? winloseTotal = jsonConvert.convert<double>(
      json['winloseTotal']);
  if (winloseTotal != null) {
    betRecordGroupEntity.winloseTotal = winloseTotal;
  }
  final int? betCountTotal = jsonConvert.convert<int>(json['betCountTotal']);
  if (betCountTotal != null) {
    betRecordGroupEntity.betCountTotal = betCountTotal;
  }
  final List<BetRecordGroupRecord>? record = (json['record'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<BetRecordGroupRecord>(e) as BetRecordGroupRecord)
      .toList();
  if (record != null) {
    betRecordGroupEntity.record = record;
  }
  return betRecordGroupEntity;
}

Map<String, dynamic> $BetRecordGroupEntityToJson(BetRecordGroupEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['betAmountTotal'] = entity.betAmountTotal;
  data['validAmountTotal'] = entity.validAmountTotal;
  data['winloseTotal'] = entity.winloseTotal;
  data['betCountTotal'] = entity.betCountTotal;
  data['record'] = entity.record?.map((v) => v.toJson()).toList();
  return data;
}

extension BetRecordGroupEntityExtension on BetRecordGroupEntity {
  BetRecordGroupEntity copyWith({
    double? betAmountTotal,
    String? validAmountTotal,
    double? winloseTotal,
    int? betCountTotal,
    List<BetRecordGroupRecord>? record,
  }) {
    return BetRecordGroupEntity()
      ..betAmountTotal = betAmountTotal ?? this.betAmountTotal
      ..validAmountTotal = validAmountTotal ?? this.validAmountTotal
      ..winloseTotal = winloseTotal ?? this.winloseTotal
      ..betCountTotal = betCountTotal ?? this.betCountTotal
      ..record = record ?? this.record;
  }
}

BetRecordGroupRecord $BetRecordGroupRecordFromJson(Map<String, dynamic> json) {
  final BetRecordGroupRecord betRecordGroupRecord = BetRecordGroupRecord();
  final String? betamount = jsonConvert.convert<String>(json['betamount']);
  if (betamount != null) {
    betRecordGroupRecord.betamount = betamount;
  }
  final String? validamount = jsonConvert.convert<String>(json['validamount']);
  if (validamount != null) {
    betRecordGroupRecord.validamount = validamount;
  }
  final double? winlose = jsonConvert.convert<double>(json['winlose']);
  if (winlose != null) {
    betRecordGroupRecord.winlose = winlose;
  }
  final String? betCount = jsonConvert.convert<String>(json['betCount']);
  if (betCount != null) {
    betRecordGroupRecord.betCount = betCount;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    betRecordGroupRecord.time = time;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    betRecordGroupRecord.title = title;
  }
  final String? cur = jsonConvert.convert<String>(json['cur']);
  if (cur != null) {
    betRecordGroupRecord.cur = cur;
  }
  return betRecordGroupRecord;
}

Map<String, dynamic> $BetRecordGroupRecordToJson(BetRecordGroupRecord entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['betamount'] = entity.betamount;
  data['validamount'] = entity.validamount;
  data['winlose'] = entity.winlose;
  data['betCount'] = entity.betCount;
  data['time'] = entity.time;
  data['title'] = entity.title;
  data['cur'] = entity.cur;
  return data;
}

extension BetRecordGroupRecordExtension on BetRecordGroupRecord {
  BetRecordGroupRecord copyWith({
    String? betamount,
    String? validamount,
    double? winlose,
    String? betCount,
    String? time,
    String? title,
    String? cur,
  }) {
    return BetRecordGroupRecord()
      ..betamount = betamount ?? this.betamount
      ..validamount = validamount ?? this.validamount
      ..winlose = winlose ?? this.winlose
      ..betCount = betCount ?? this.betCount
      ..time = time ?? this.time
      ..title = title ?? this.title
      ..cur = cur ?? this.cur;
  }
}