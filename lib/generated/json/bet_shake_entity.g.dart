import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/bet_shake_entity.dart';

BetShakeEntity $BetShakeEntityFromJson(Map<String, dynamic> json) {
  final BetShakeEntity betShakeEntity = BetShakeEntity();
  final int? drawPrizeCount = jsonConvert.convert<int>(json['drawPrizeCount']);
  if (drawPrizeCount != null) {
    betShakeEntity.drawPrizeCount = drawPrizeCount;
  }
  final int? bonusId = jsonConvert.convert<int>(json['bonusId']);
  if (bonusId != null) {
    betShakeEntity.bonusId = bonusId;
  }
  final double? point = jsonConvert.convert<double>(json['point']);
  if (point != null) {
    betShakeEntity.point = point;
  }
  final double? bonus = jsonConvert.convert<double>(json['bonus']);
  if (bonus != null) {
    betShakeEntity.bonus = bonus;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    betShakeEntity.currency = currency;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    betShakeEntity.remark = remark;
  }
  return betShakeEntity;
}

Map<String, dynamic> $BetShakeEntityToJson(BetShakeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['drawPrizeCount'] = entity.drawPrizeCount;
  data['bonusId'] = entity.bonusId;
  data['point'] = entity.point;
  data['bonus'] = entity.bonus;
  data['currency'] = entity.currency;
  data['remark'] = entity.remark;
  return data;
}

extension BetShakeEntityExtension on BetShakeEntity {
  BetShakeEntity copyWith({
    int? drawPrizeCount,
    int? bonusId,
    double? point,
    double? bonus,
    String? currency,
    String? remark,
  }) {
    return BetShakeEntity()
      ..drawPrizeCount = drawPrizeCount ?? this.drawPrizeCount
      ..bonusId = bonusId ?? this.bonusId
      ..point = point ?? this.point
      ..bonus = bonus ?? this.bonus
      ..currency = currency ?? this.currency
      ..remark = remark ?? this.remark;
  }
}