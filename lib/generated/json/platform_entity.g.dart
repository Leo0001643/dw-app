import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/platform_entity.dart';

PlatformEntity $PlatformEntityFromJson(Map<String, dynamic> json) {
  final PlatformEntity platformEntity = PlatformEntity();
  final int? liveId = jsonConvert.convert<int>(json['liveId']);
  if (liveId != null) {
    platformEntity.liveId = liveId;
  }
  final String? liveName = jsonConvert.convert<String>(json['liveName']);
  if (liveName != null) {
    platformEntity.liveName = liveName;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    platformEntity.currency = currency;
  }
  final double? money = jsonConvert.convert<double>(json['money']);
  if (money != null) {
    platformEntity.money = money;
  }
  return platformEntity;
}

Map<String, dynamic> $PlatformEntityToJson(PlatformEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['liveId'] = entity.liveId;
  data['liveName'] = entity.liveName;
  data['currency'] = entity.currency;
  data['money'] = entity.money;
  return data;
}

extension PlatformEntityExtension on PlatformEntity {
  PlatformEntity copyWith({
    int? liveId,
    String? liveName,
    String? currency,
    double? money,
  }) {
    return PlatformEntity()
      ..liveId = liveId ?? this.liveId
      ..liveName = liveName ?? this.liveName
      ..currency = currency ?? this.currency
      ..money = money ?? this.money;
  }
}