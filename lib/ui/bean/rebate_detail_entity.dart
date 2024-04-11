import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/rebate_detail_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/rebate_detail_entity.g.dart';

@JsonSerializable()
class RebateDetailEntity {
  String? gameType;
  String? lossMoney;
  String? lossMoneyBonus;
  String? validBetMoney;

  RebateDetailEntity();

  factory RebateDetailEntity.fromJson(Map<String, dynamic> json) => $RebateDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $RebateDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}