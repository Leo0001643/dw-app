import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/back_water_entity.dart';

BackWaterEntity $BackWaterEntityFromJson(Map<String, dynamic> json) {
  final BackWaterEntity backWaterEntity = BackWaterEntity();
  final String? gameName = jsonConvert.convert<String>(json['gameName']);
  if (gameName != null) {
    backWaterEntity.gameName = gameName;
  }
  final String? gameType = jsonConvert.convert<String>(json['gameType']);
  if (gameType != null) {
    backWaterEntity.gameType = gameType;
  }
  final String? lossMoney = jsonConvert.convert<String>(json['lossMoney']);
  if (lossMoney != null) {
    backWaterEntity.lossMoney = lossMoney;
  }
  final double? lossMoneyBonus = jsonConvert.convert<double>(
      json['lossMoneyBonus']);
  if (lossMoneyBonus != null) {
    backWaterEntity.lossMoneyBonus = lossMoneyBonus;
  }
  final String? validBetMoney = jsonConvert.convert<String>(
      json['validBetMoney']);
  if (validBetMoney != null) {
    backWaterEntity.validBetMoney = validBetMoney;
  }
  return backWaterEntity;
}

Map<String, dynamic> $BackWaterEntityToJson(BackWaterEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameName'] = entity.gameName;
  data['gameType'] = entity.gameType;
  data['lossMoney'] = entity.lossMoney;
  data['lossMoneyBonus'] = entity.lossMoneyBonus;
  data['validBetMoney'] = entity.validBetMoney;
  return data;
}

extension BackWaterEntityExtension on BackWaterEntity {
  BackWaterEntity copyWith({
    String? gameName,
    String? gameType,
    String? lossMoney,
    double? lossMoneyBonus,
    String? validBetMoney,
  }) {
    return BackWaterEntity()
      ..gameName = gameName ?? this.gameName
      ..gameType = gameType ?? this.gameType
      ..lossMoney = lossMoney ?? this.lossMoney
      ..lossMoneyBonus = lossMoneyBonus ?? this.lossMoneyBonus
      ..validBetMoney = validBetMoney ?? this.validBetMoney;
  }
}