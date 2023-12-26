import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/shake_info_entity.dart';

ShakeInfoEntity $ShakeInfoEntityFromJson(Map<String, dynamic> json) {
  final ShakeInfoEntity shakeInfoEntity = ShakeInfoEntity();
  final double? point = jsonConvert.convert<double>(json['point']);
  if (point != null) {
    shakeInfoEntity.point = point;
  }
  final List<ShakeInfoShakes>? shakes = (json['shakes'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ShakeInfoShakes>(e) as ShakeInfoShakes)
      .toList();
  if (shakes != null) {
    shakeInfoEntity.shakes = shakes;
  }
  return shakeInfoEntity;
}

Map<String, dynamic> $ShakeInfoEntityToJson(ShakeInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['point'] = entity.point;
  data['shakes'] = entity.shakes?.map((v) => v.toJson()).toList();
  return data;
}

extension ShakeInfoEntityExtension on ShakeInfoEntity {
  ShakeInfoEntity copyWith({
    double? point,
    List<ShakeInfoShakes>? shakes,
  }) {
    return ShakeInfoEntity()
      ..point = point ?? this.point
      ..shakes = shakes ?? this.shakes;
  }
}

ShakeInfoShakes $ShakeInfoShakesFromJson(Map<String, dynamic> json) {
  final ShakeInfoShakes shakeInfoShakes = ShakeInfoShakes();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    shakeInfoShakes.id = id;
  }
  final double? money = jsonConvert.convert<double>(json['money']);
  if (money != null) {
    shakeInfoShakes.money = money;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    shakeInfoShakes.currency = currency;
  }
  return shakeInfoShakes;
}

Map<String, dynamic> $ShakeInfoShakesToJson(ShakeInfoShakes entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['money'] = entity.money;
  data['currency'] = entity.currency;
  return data;
}

extension ShakeInfoShakesExtension on ShakeInfoShakes {
  ShakeInfoShakes copyWith({
    int? id,
    double? money,
    String? currency,
  }) {
    return ShakeInfoShakes()
      ..id = id ?? this.id
      ..money = money ?? this.money
      ..currency = currency ?? this.currency;
  }
}