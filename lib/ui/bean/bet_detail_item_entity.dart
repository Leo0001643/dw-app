import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/bet_detail_item_entity.g.dart';


@JsonSerializable()
class BetDetailItemEntity {
  num? betamount;
  num? validAmount;
  num? winlose;
  num? betCount;
  num? gameKind;
  String? gameKindName;
  String? gameName;
  num? gameType;
  String? currency;
  List<BetDetailItemEntity>? record;

  BetDetailItemEntity({
    this.betamount,
    this.validAmount,
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
      $BetDetailItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $BetDetailItemEntityToJson(this);


  @override
  String toString() {
    return jsonEncode(this);
  }
}
