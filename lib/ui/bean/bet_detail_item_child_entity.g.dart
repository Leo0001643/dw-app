// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet_detail_item_child_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BetDetailItemChildEntity _$BetDetailItemChildEntityFromJson(
        Map<String, dynamic> json) =>
    BetDetailItemChildEntity(
      record: (json['record'] as List<dynamic>?)
          ?.map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] == null
          ? null
          : Total.fromJson(json['total'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BetDetailItemChildEntityToJson(
        BetDetailItemChildEntity instance) =>
    <String, dynamic>{
      'record': instance.record,
      'total': instance.total,
    };

Record _$RecordFromJson(Map<String, dynamic> json) => Record(
      username: json['username'] as String?,
      betamount: json['betamount'] as num?,
      validamount: json['validamount'] as num?,
      winlose: json['winlose'] as num?,
      betTime: json['betTime'] as String?,
      gameType: json['gameType'] as String?,
      gameName: json['gameName'] as String?,
      billNo: json['billNo'] as String?,
      qishu: json['qishu'] as String?,
      item: json['item'] as String?,
      play: json['play'] as String?,
      odds: json['odds'] as String?,
      txt1: json['txt1'] as String?,
      txt2: json['txt2'] as String?,
    );

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'username': instance.username,
      'betamount': instance.betamount,
      'validamount': instance.validamount,
      'winlose': instance.winlose,
      'betTime': instance.betTime,
      'gameType': instance.gameType,
      'gameName': instance.gameName,
      'billNo': instance.billNo,
      'qishu': instance.qishu,
      'item': instance.item,
      'play': instance.play,
      'odds': instance.odds,
      'txt1': instance.txt1,
      'txt2': instance.txt2,
    };

Total _$TotalFromJson(Map<String, dynamic> json) => Total(
      betAmountTotal: json['betAmountTotal'] as num?,
      validAmountTotal: json['validAmountTotal'] as num?,
      winloseTotal: json['winloseTotal'] as num?,
      betCountTotal: json['betCountTotal'] as num?,
    );

Map<String, dynamic> _$TotalToJson(Total instance) => <String, dynamic>{
      'betAmountTotal': instance.betAmountTotal,
      'validAmountTotal': instance.validAmountTotal,
      'winloseTotal': instance.winloseTotal,
      'betCountTotal': instance.betCountTotal,
    };
