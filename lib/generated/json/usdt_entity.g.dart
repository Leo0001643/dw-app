import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/usdt_entity.dart';
import 'package:json_annotation/json_annotation.dart';


UsdtEntity $UsdtEntityFromJson(Map<String, dynamic> json) {
  final UsdtEntity usdtEntity = UsdtEntity();
  final String? account = jsonConvert.convert<String>(json['account']);
  if (account != null) {
    usdtEntity.account = account;
  }
  final num? status = jsonConvert.convert<num>(json['status']);
  if (status != null) {
    usdtEntity.status = status;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    usdtEntity.type = type;
  }
  return usdtEntity;
}

Map<String, dynamic> $UsdtEntityToJson(UsdtEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['account'] = entity.account;
  data['status'] = entity.status;
  data['type'] = entity.type;
  return data;
}

extension UsdtEntityExtension on UsdtEntity {
  UsdtEntity copyWith({
    String? account,
    num? status,
    String? type,
  }) {
    return UsdtEntity()
      ..account = account ?? this.account
      ..status = status ?? this.status
      ..type = type ?? this.type;
  }
}