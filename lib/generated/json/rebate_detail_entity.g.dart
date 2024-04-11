import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/rebate_detail_entity.dart';

RebateDetailEntity $RebateDetailEntityFromJson(Map<String, dynamic> json) {
  final RebateDetailEntity rebateDetailEntity = RebateDetailEntity();
  final String? gameType = jsonConvert.convert<String>(json['gameType']);
  if (gameType != null) {
    rebateDetailEntity.gameType = gameType;
  }
  final String? lossMoney = jsonConvert.convert<String>(json['lossMoney']);
  if (lossMoney != null) {
    rebateDetailEntity.lossMoney = lossMoney;
  }
  final String? lossMoneyBonus = jsonConvert.convert<String>(
      json['lossMoneyBonus']);
  if (lossMoneyBonus != null) {
    rebateDetailEntity.lossMoneyBonus = lossMoneyBonus;
  }
  final String? validBetMoney = jsonConvert.convert<String>(
      json['validBetMoney']);
  if (validBetMoney != null) {
    rebateDetailEntity.validBetMoney = validBetMoney;
  }
  return rebateDetailEntity;
}

Map<String, dynamic> $RebateDetailEntityToJson(RebateDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameType'] = entity.gameType;
  data['lossMoney'] = entity.lossMoney;
  data['lossMoneyBonus'] = entity.lossMoneyBonus;
  data['validBetMoney'] = entity.validBetMoney;
  return data;
}

extension RebateDetailEntityExtension on RebateDetailEntity {
  RebateDetailEntity copyWith({
    String? gameType,
    String? lossMoney,
    String? lossMoneyBonus,
    String? validBetMoney,
  }) {
    return RebateDetailEntity()
      ..gameType = gameType ?? this.gameType
      ..lossMoney = lossMoney ?? this.lossMoney
      ..lossMoneyBonus = lossMoneyBonus ?? this.lossMoneyBonus
      ..validBetMoney = validBetMoney ?? this.validBetMoney;
  }
}