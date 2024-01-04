// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet_detail_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BetDetailItemEntity _$BetDetailItemEntityFromJson(Map<String, dynamic> json) =>
    BetDetailItemEntity(
      betamount: json['betamount'] as num?,
      validamount: json['validamount'] as num?,
      winlose: json['winlose'] as num?,
      betCount: json['betCount'] as num?,
      currency: json['currency'] as String?,
      record: (json['record'] as List<dynamic>?)
          ?.map((e) => BetDetailItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameKind: json['gameKind'] as num?,
      gameKindName: json['gameKindName'] as String?,
      gameName: json['gameName'] as String?,
      gameType: json['gameType'] as num?,
    );

Map<String, dynamic> _$BetDetailItemEntityToJson(
        BetDetailItemEntity instance) =>
    <String, dynamic>{
      'betamount': instance.betamount,
      'validamount': instance.validamount,
      'winlose': instance.winlose,
      'betCount': instance.betCount,
      'gameKind': instance.gameKind,
      'gameKindName': instance.gameKindName,
      'gameName': instance.gameName,
      'gameType': instance.gameType,
      'currency': instance.currency,
      'record': instance.record,
    };
