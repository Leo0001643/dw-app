import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/constitute_ratio_entity.dart';

ConstituteRatioEntity $ConstituteRatioEntityFromJson(
    Map<String, dynamic> json) {
  final ConstituteRatioEntity constituteRatioEntity = ConstituteRatioEntity();
  final double? lossMoney = jsonConvert.convert<double>(json['lossMoney']);
  if (lossMoney != null) {
    constituteRatioEntity.lossMoney = lossMoney;
  }
  final double? lossMoneyBonus = jsonConvert.convert<double>(
      json['lossMoneyBonus']);
  if (lossMoneyBonus != null) {
    constituteRatioEntity.lossMoneyBonus = lossMoneyBonus;
  }
  final double? combinBetMoney = jsonConvert.convert<double>(
      json['combinBetMoney']);
  if (combinBetMoney != null) {
    constituteRatioEntity.combinBetMoney = combinBetMoney;
  }
  final double? combinBetRatio = jsonConvert.convert<double>(
      json['combinBetRatio']);
  if (combinBetRatio != null) {
    constituteRatioEntity.combinBetRatio = combinBetRatio;
  }
  final double? activityMode = jsonConvert.convert<double>(
      json['activityMode']);
  if (activityMode != null) {
    constituteRatioEntity.activityMode = activityMode;
  }
  final double? basicBetMoney = jsonConvert.convert<double>(
      json['basicBetMoney']);
  if (basicBetMoney != null) {
    constituteRatioEntity.basicBetMoney = basicBetMoney;
  }
  final int? betTermCount = jsonConvert.convert<int>(json['betTermCount']);
  if (betTermCount != null) {
    constituteRatioEntity.betTermCount = betTermCount;
  }
  return constituteRatioEntity;
}

Map<String, dynamic> $ConstituteRatioEntityToJson(
    ConstituteRatioEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['lossMoney'] = entity.lossMoney;
  data['lossMoneyBonus'] = entity.lossMoneyBonus;
  data['combinBetMoney'] = entity.combinBetMoney;
  data['combinBetRatio'] = entity.combinBetRatio;
  data['activityMode'] = entity.activityMode;
  data['basicBetMoney'] = entity.basicBetMoney;
  data['betTermCount'] = entity.betTermCount;
  return data;
}

extension ConstituteRatioEntityExtension on ConstituteRatioEntity {
  ConstituteRatioEntity copyWith({
    double? lossMoney,
    double? lossMoneyBonus,
    double? combinBetMoney,
    double? combinBetRatio,
    double? activityMode,
    double? basicBetMoney,
    int? betTermCount,
  }) {
    return ConstituteRatioEntity()
      ..lossMoney = lossMoney ?? this.lossMoney
      ..lossMoneyBonus = lossMoneyBonus ?? this.lossMoneyBonus
      ..combinBetMoney = combinBetMoney ?? this.combinBetMoney
      ..combinBetRatio = combinBetRatio ?? this.combinBetRatio
      ..activityMode = activityMode ?? this.activityMode
      ..basicBetMoney = basicBetMoney ?? this.basicBetMoney
      ..betTermCount = betTermCount ?? this.betTermCount;
  }
}