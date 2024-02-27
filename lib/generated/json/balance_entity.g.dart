import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/balance_entity.dart';


BalanceEntity $BalanceEntityFromJson(Map<String, dynamic> json) {
  final BalanceEntity balanceEntity = BalanceEntity();
  final double? money = jsonConvert.convert<double>(json['money']);
  if (money != null) {
    balanceEntity.money = money;
  }
  final String? language = jsonConvert.convert<String>(json['language']);
  if (language != null) {
    balanceEntity.language = language;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    balanceEntity.icon = icon;
  }
  return balanceEntity;
}

Map<String, dynamic> $BalanceEntityToJson(BalanceEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['money'] = entity.money;
  data['language'] = entity.language;
  data['icon'] = entity.icon;
  return data;
}

extension BalanceEntityExtension on BalanceEntity {
  BalanceEntity copyWith({
    double? money,
    String? language,
    String? icon,
  }) {
    return BalanceEntity()
      ..money = money ?? this.money
      ..language = language ?? this.language
      ..icon = icon ?? this.icon;
  }
}