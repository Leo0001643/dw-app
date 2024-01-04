import 'package:json_annotation/json_annotation.dart';

part 'bet_detail_item_entity.g.dart';

@JsonSerializable()
class BetDetailItemEntity {
  final int? betamount;
  final int? validamount;
  final int? winlose;
  final int? betCount;
  final String? currency;
  final List<Record>? record;

  const BetDetailItemEntity({
    this.betamount,
    this.validamount,
    this.winlose,
    this.betCount,
    this.currency,
    this.record,
  });

  factory BetDetailItemEntity.fromJson(Map<String, dynamic> json) =>
      _$BetDetailItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BetDetailItemEntityToJson(this);
}

@JsonSerializable()
class Record {
  final int? betamount;
  final int? validamount;
  final int? winlose;
  final int? betCount;
  final int? gameKind;
  final String? gameKindName;
  final String? gameName;
  final int? gameType;
  final String? currency;

  const Record({
    this.betamount,
    this.validamount,
    this.winlose,
    this.betCount,
    this.gameKind,
    this.gameKindName,
    this.gameName,
    this.gameType,
    this.currency,
  });

  factory Record.fromJson(Map<String, dynamic> json) =>
      _$RecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecordToJson(this);
}
