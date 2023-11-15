import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';

BalanceEntity $BalanceEntityFromJson(Map<String, dynamic> json) {
  final BalanceEntity balanceEntity = BalanceEntity();
  final double? money = jsonConvert.convert<double>(json['money']);
  if (money != null) {
    balanceEntity.money = money;
  }
  return balanceEntity;
}

Map<String, dynamic> $BalanceEntityToJson(BalanceEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['money'] = entity.money;
  return data;
}

extension BalanceEntityExtension on BalanceEntity {
  BalanceEntity copyWith({
    double? money,
  }) {
    return BalanceEntity()
      ..money = money ?? this.money;
  }
}