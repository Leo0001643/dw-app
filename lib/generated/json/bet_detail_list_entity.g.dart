import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/bet_detail_list_entity.dart';

BetDetailListEntity $BetDetailListEntityFromJson(Map<String, dynamic> json) {
  final BetDetailListEntity betDetailListEntity = BetDetailListEntity();
  final double? betamount = jsonConvert.convert<double>(json['betamount']);
  if (betamount != null) {
    betDetailListEntity.betamount = betamount;
  }
  final double? validamount = jsonConvert.convert<double>(json['validamount']);
  if (validamount != null) {
    betDetailListEntity.validamount = validamount;
  }
  final double? winlose = jsonConvert.convert<double>(json['winlose']);
  if (winlose != null) {
    betDetailListEntity.winlose = winlose;
  }
  final int? betCount = jsonConvert.convert<int>(json['betCount']);
  if (betCount != null) {
    betDetailListEntity.betCount = betCount;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    betDetailListEntity.currency = currency;
  }
  final List<BetDetailListRecord>? record = (json['record'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<BetDetailListRecord>(e) as BetDetailListRecord)
      .toList();
  if (record != null) {
    betDetailListEntity.record = record;
  }
  return betDetailListEntity;
}

Map<String, dynamic> $BetDetailListEntityToJson(BetDetailListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['betamount'] = entity.betamount;
  data['validamount'] = entity.validamount;
  data['winlose'] = entity.winlose;
  data['betCount'] = entity.betCount;
  data['currency'] = entity.currency;
  data['record'] = entity.record?.map((v) => v.toJson()).toList();
  return data;
}

extension BetDetailListEntityExtension on BetDetailListEntity {
  BetDetailListEntity copyWith({
    double? betamount,
    double? validamount,
    double? winlose,
    int? betCount,
    String? currency,
    List<BetDetailListRecord>? record,
  }) {
    return BetDetailListEntity()
      ..betamount = betamount ?? this.betamount
      ..validamount = validamount ?? this.validamount
      ..winlose = winlose ?? this.winlose
      ..betCount = betCount ?? this.betCount
      ..currency = currency ?? this.currency
      ..record = record ?? this.record;
  }
}

BetDetailListRecord $BetDetailListRecordFromJson(Map<String, dynamic> json) {
  final BetDetailListRecord betDetailListRecord = BetDetailListRecord();
  final double? betAmount = jsonConvert.convert<double>(json['betAmount']);
  if (betAmount != null) {
    betDetailListRecord.betAmount = betAmount;
  }
  final double? validAmount = jsonConvert.convert<double>(json['validAmount']);
  if (validAmount != null) {
    betDetailListRecord.validAmount = validAmount;
  }
  final double? winlose = jsonConvert.convert<double>(json['winlose']);
  if (winlose != null) {
    betDetailListRecord.winlose = winlose;
  }
  final int? betCount = jsonConvert.convert<int>(json['betCount']);
  if (betCount != null) {
    betDetailListRecord.betCount = betCount;
  }
  final int? gameKind = jsonConvert.convert<int>(json['gameKind']);
  if (gameKind != null) {
    betDetailListRecord.gameKind = gameKind;
  }
  final String? gameKindName = jsonConvert.convert<String>(
      json['gameKindName']);
  if (gameKindName != null) {
    betDetailListRecord.gameKindName = gameKindName;
  }
  final List<BetDetailListRecordRecord>? record = (json['record'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<BetDetailListRecordRecord>(
          e) as BetDetailListRecordRecord).toList();
  if (record != null) {
    betDetailListRecord.record = record;
  }
  return betDetailListRecord;
}

Map<String, dynamic> $BetDetailListRecordToJson(BetDetailListRecord entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['betAmount'] = entity.betAmount;
  data['validAmount'] = entity.validAmount;
  data['winlose'] = entity.winlose;
  data['betCount'] = entity.betCount;
  data['gameKind'] = entity.gameKind;
  data['gameKindName'] = entity.gameKindName;
  data['record'] = entity.record?.map((v) => v.toJson()).toList();
  return data;
}

extension BetDetailListRecordExtension on BetDetailListRecord {
  BetDetailListRecord copyWith({
    double? betAmount,
    double? validAmount,
    double? winlose,
    int? betCount,
    int? gameKind,
    String? gameKindName,
    List<BetDetailListRecordRecord>? record,
  }) {
    return BetDetailListRecord()
      ..betAmount = betAmount ?? this.betAmount
      ..validAmount = validAmount ?? this.validAmount
      ..winlose = winlose ?? this.winlose
      ..betCount = betCount ?? this.betCount
      ..gameKind = gameKind ?? this.gameKind
      ..gameKindName = gameKindName ?? this.gameKindName
      ..record = record ?? this.record;
  }
}

BetDetailListRecordRecord $BetDetailListRecordRecordFromJson(
    Map<String, dynamic> json) {
  final BetDetailListRecordRecord betDetailListRecordRecord = BetDetailListRecordRecord();
  final double? betamount = jsonConvert.convert<double>(json['betamount']);
  if (betamount != null) {
    betDetailListRecordRecord.betamount = betamount;
  }
  final double? validamount = jsonConvert.convert<double>(json['validamount']);
  if (validamount != null) {
    betDetailListRecordRecord.validamount = validamount;
  }
  final double? winlose = jsonConvert.convert<double>(json['winlose']);
  if (winlose != null) {
    betDetailListRecordRecord.winlose = winlose;
  }
  final int? betCount = jsonConvert.convert<int>(json['betCount']);
  if (betCount != null) {
    betDetailListRecordRecord.betCount = betCount;
  }
  final int? gameKind = jsonConvert.convert<int>(json['gameKind']);
  if (gameKind != null) {
    betDetailListRecordRecord.gameKind = gameKind;
  }
  final String? gameKindName = jsonConvert.convert<String>(
      json['gameKindName']);
  if (gameKindName != null) {
    betDetailListRecordRecord.gameKindName = gameKindName;
  }
  final String? gameName = jsonConvert.convert<String>(json['gameName']);
  if (gameName != null) {
    betDetailListRecordRecord.gameName = gameName;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    betDetailListRecordRecord.gameType = gameType;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    betDetailListRecordRecord.currency = currency;
  }
  return betDetailListRecordRecord;
}

Map<String, dynamic> $BetDetailListRecordRecordToJson(
    BetDetailListRecordRecord entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['betamount'] = entity.betamount;
  data['validamount'] = entity.validamount;
  data['winlose'] = entity.winlose;
  data['betCount'] = entity.betCount;
  data['gameKind'] = entity.gameKind;
  data['gameKindName'] = entity.gameKindName;
  data['gameName'] = entity.gameName;
  data['gameType'] = entity.gameType;
  data['currency'] = entity.currency;
  return data;
}

extension BetDetailListRecordRecordExtension on BetDetailListRecordRecord {
  BetDetailListRecordRecord copyWith({
    double? betamount,
    double? validamount,
    double? winlose,
    int? betCount,
    int? gameKind,
    String? gameKindName,
    String? gameName,
    int? gameType,
    String? currency,
  }) {
    return BetDetailListRecordRecord()
      ..betamount = betamount ?? this.betamount
      ..validamount = validamount ?? this.validamount
      ..winlose = winlose ?? this.winlose
      ..betCount = betCount ?? this.betCount
      ..gameKind = gameKind ?? this.gameKind
      ..gameKindName = gameKindName ?? this.gameKindName
      ..gameName = gameName ?? this.gameName
      ..gameType = gameType ?? this.gameType
      ..currency = currency ?? this.currency;
  }
}