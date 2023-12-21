import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/ele_game_type_entity.dart';

EleGameTypeEntity $EleGameTypeEntityFromJson(Map<String, dynamic> json) {
  final EleGameTypeEntity eleGameTypeEntity = EleGameTypeEntity();
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    eleGameTypeEntity.currency = currency;
  }
  final String? gametype = jsonConvert.convert<String>(json['gametype']);
  if (gametype != null) {
    eleGameTypeEntity.gametype = gametype;
  }
  final int? orderby = jsonConvert.convert<int>(json['orderby']);
  if (orderby != null) {
    eleGameTypeEntity.orderby = orderby;
  }
  return eleGameTypeEntity;
}

Map<String, dynamic> $EleGameTypeEntityToJson(EleGameTypeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['currency'] = entity.currency;
  data['gametype'] = entity.gametype;
  data['orderby'] = entity.orderby;
  return data;
}

extension EleGameTypeEntityExtension on EleGameTypeEntity {
  EleGameTypeEntity copyWith({
    String? currency,
    String? gametype,
    int? orderby,
  }) {
    return EleGameTypeEntity()
      ..currency = currency ?? this.currency
      ..gametype = gametype ?? this.gametype
      ..orderby = orderby ?? this.orderby;
  }
}