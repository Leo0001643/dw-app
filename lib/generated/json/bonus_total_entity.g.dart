import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/bonus_total_entity.dart';

BonusTotalEntity $BonusTotalEntityFromJson(Map<String, dynamic> json) {
  final BonusTotalEntity bonusTotalEntity = BonusTotalEntity();
  final double? bonusTotal = jsonConvert.convert<double>(json['bonusTotal']);
  if (bonusTotal != null) {
    bonusTotalEntity.bonusTotal = bonusTotal;
  }
  return bonusTotalEntity;
}

Map<String, dynamic> $BonusTotalEntityToJson(BonusTotalEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bonusTotal'] = entity.bonusTotal;
  return data;
}

extension BonusTotalEntityExtension on BonusTotalEntity {
  BonusTotalEntity copyWith({
    double? bonusTotal,
  }) {
    return BonusTotalEntity()
      ..bonusTotal = bonusTotal ?? this.bonusTotal;
  }
}