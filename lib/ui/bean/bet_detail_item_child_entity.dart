import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/bet_detail_item_child_entity.g.dart';


@JsonSerializable()
class BetDetailItemChildEntity {
  List<Record>? record;
  Total? total;

  BetDetailItemChildEntity({
    this.record,
    this.total,
  });

  factory BetDetailItemChildEntity.fromJson(Map<String, dynamic> json) => $BetDetailItemChildEntityFromJson(json);

  Map<String, dynamic> toJson() => $BetDetailItemChildEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }


}

@JsonSerializable()
class Record {
  int? siteId;
  String? username;
  String? tableId;
  String? betamount;
  String? validamount;
  int? winlose;
  String? betTime;
  String? gameType;
  String? gameName;
  String? billNo;
  String? qishu;
  String? odds;
  String? odds2;
  String? txt1;


  Record();

  factory Record.fromJson(Map<String, dynamic> json) => $RecordFromJson(json);

  Map<String, dynamic> toJson() => $RecordToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }


}

@JsonSerializable()
class Total {
  int? betAmountTotal;
  double? validAmountTotal;
  double? winloseTotal;
  int? betCountTotal;
  String? currency;

  Total();

  factory Total.fromJson(Map<String, dynamic> json) =>
      $TotalFromJson(json);

  Map<String, dynamic> toJson() => $TotalToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

}
