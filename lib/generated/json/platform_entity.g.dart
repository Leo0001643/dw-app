import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/platform_entity.dart';
import 'package:leisure_games/app/global.dart';

import 'package:leisure_games/app/intl/intr.dart';


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
  final int? sequence = jsonConvert.convert<int>(json['sequence']);
  if (sequence != null) {
    platformEntity.sequence = sequence;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    platformEntity.status = status;
  }
  return platformEntity;
}

Map<String, dynamic> $PlatformEntityToJson(PlatformEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['liveId'] = entity.liveId;
  data['liveName'] = entity.liveName;
  data['currency'] = entity.currency;
  data['money'] = entity.money;
  data['sequence'] = entity.sequence;
  data['status'] = entity.status;
  return data;
}

extension PlatformEntityExtension on PlatformEntity {
  PlatformEntity copyWith({
    int? liveId,
    String? liveName,
    String? currency,
    double? money,
    int? sequence,
    int? status,
  }) {
    return PlatformEntity()
      ..liveId = liveId ?? this.liveId
      ..liveName = liveName ?? this.liveName
      ..currency = currency ?? this.currency
      ..money = money ?? this.money
      ..sequence = sequence ?? this.sequence
      ..status = status ?? this.status;
  }
}