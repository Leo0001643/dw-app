import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_entity.dart';
import 'package:json_annotation/json_annotation.dart';


BetDetailItemEntity $BetDetailItemEntityFromJson(Map<String, dynamic> json) {
  final BetDetailItemEntity betDetailItemEntity = BetDetailItemEntity();
  final num? betamount = jsonConvert.convert<num>(json['betamount']);
  if (betamount != null) {
    betDetailItemEntity.betamount = betamount;
  }
  final num? validAmount = jsonConvert.convert<num>(json['validAmount']);
  if (validAmount != null) {
    betDetailItemEntity.validAmount = validAmount;
  }
  final num? winlose = jsonConvert.convert<num>(json['winlose']);
  if (winlose != null) {
    betDetailItemEntity.winlose = winlose;
  }
  final num? betCount = jsonConvert.convert<num>(json['betCount']);
  if (betCount != null) {
    betDetailItemEntity.betCount = betCount;
  }
  final num? gameKind = jsonConvert.convert<num>(json['gameKind']);
  if (gameKind != null) {
    betDetailItemEntity.gameKind = gameKind;
  }
  final String? gameKindName = jsonConvert.convert<String>(
      json['gameKindName']);
  if (gameKindName != null) {
    betDetailItemEntity.gameKindName = gameKindName;
  }
  final String? gameName = jsonConvert.convert<String>(json['gameName']);
  if (gameName != null) {
    betDetailItemEntity.gameName = gameName;
  }
  final num? gameType = jsonConvert.convert<num>(json['gameType']);
  if (gameType != null) {
    betDetailItemEntity.gameType = gameType;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    betDetailItemEntity.currency = currency;
  }
  final List<BetDetailItemEntity>? record = (json['record'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<BetDetailItemEntity>(e) as BetDetailItemEntity)
      .toList();
  if (record != null) {
    betDetailItemEntity.record = record;
  }
  return betDetailItemEntity;
}

Map<String, dynamic> $BetDetailItemEntityToJson(BetDetailItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['betamount'] = entity.betamount;
  data['validAmount'] = entity.validAmount;
  data['winlose'] = entity.winlose;
  data['betCount'] = entity.betCount;
  data['gameKind'] = entity.gameKind;
  data['gameKindName'] = entity.gameKindName;
  data['gameName'] = entity.gameName;
  data['gameType'] = entity.gameType;
  data['currency'] = entity.currency;
  data['record'] = entity.record?.map((v) => v.toJson()).toList();
  return data;
}

extension BetDetailItemEntityExtension on BetDetailItemEntity {
  BetDetailItemEntity copyWith({
    num? betamount,
    num? validAmount,
    num? winlose,
    num? betCount,
    num? gameKind,
    String? gameKindName,
    String? gameName,
    num? gameType,
    String? currency,
    List<BetDetailItemEntity>? record,
  }) {
    return BetDetailItemEntity()
      ..betamount = betamount ?? this.betamount
      ..validAmount = validAmount ?? this.validAmount
      ..winlose = winlose ?? this.winlose
      ..betCount = betCount ?? this.betCount
      ..gameKind = gameKind ?? this.gameKind
      ..gameKindName = gameKindName ?? this.gameKindName
      ..gameName = gameName ?? this.gameName
      ..gameType = gameType ?? this.gameType
      ..currency = currency ?? this.currency
      ..record = record ?? this.record;
  }
}