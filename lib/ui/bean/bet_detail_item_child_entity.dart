import 'package:json_annotation/json_annotation.dart';

part 'bet_detail_item_child_entity.g.dart';

@JsonSerializable()
class BetDetailItemChildEntity {
  final List<Record>? record;
  final Total? total;

  const BetDetailItemChildEntity({
    this.record,
    this.total,
  });

  factory BetDetailItemChildEntity.fromJson(Map<String, dynamic> json) =>
      _$BetDetailItemChildEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BetDetailItemChildEntityToJson(this);
}

@JsonSerializable()
class Record {
  final String? username;
  final num? betamount;
  final num? validamount;
  final num? winlose;
  final String? betTime;
  final String? gameType;
  final String? gameName;
  final String? billNo;
  final String? qishu;
  final String? item;
  final String? play;
  final String? odds;
  final String? txt1;
  final String? txt2;

  const Record({
    this.username,
    this.betamount,
    this.validamount,
    this.winlose,
    this.betTime,
    this.gameType,
    this.gameName,
    this.billNo,
    this.qishu,
    this.item,
    this.play,
    this.odds,
    this.txt1,
    this.txt2,
  });

  factory Record.fromJson(Map<String, dynamic> json) =>
      _$RecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecordToJson(this);
}

@JsonSerializable()
class Total {
  final num? betAmountTotal;
  final num? validAmountTotal;
  final num? winloseTotal;
  final num? betCountTotal;

  const Total({
    this.betAmountTotal,
    this.validAmountTotal,
    this.winloseTotal,
    this.betCountTotal,
  });

  factory Total.fromJson(Map<String, dynamic> json) =>
      _$TotalFromJson(json);

  Map<String, dynamic> toJson() => _$TotalToJson(this);
}
