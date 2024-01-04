import 'package:json_annotation/json_annotation.dart';

part 'bet_detail_item_entity.g.dart';

@JsonSerializable()
class BetDetailItemEntity {
  final num? betamount;
  final num? validamount;
  final num? winlose;
  final num? betCount;
  final num? gameKind;
  final String? gameKindName;
  final String? gameName;
  final num? gameType;
  final String? currency;
  final List<BetDetailItemEntity>? record;
  const BetDetailItemEntity({
    this.betamount,
    this.validamount,
    this.winlose,
    this.betCount,
    this.currency,
    this.record,
    this.gameKind,
    this.gameKindName,
    this.gameName,
    this.gameType,
  });

  factory BetDetailItemEntity.fromJson(Map<String, dynamic> json) =>
      _$BetDetailItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BetDetailItemEntityToJson(this);
}
