import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/back_water_desc_entity.dart';

BackWaterDescEntity $BackWaterDescEntityFromJson(Map<String, dynamic> json) {
  final BackWaterDescEntity backWaterDescEntity = BackWaterDescEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    backWaterDescEntity.name = name;
  }
  final String? langType = jsonConvert.convert<String>(json['lang_type']);
  if (langType != null) {
    backWaterDescEntity.langType = langType;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    backWaterDescEntity.content = content;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    backWaterDescEntity.url = url;
  }
  return backWaterDescEntity;
}

Map<String, dynamic> $BackWaterDescEntityToJson(BackWaterDescEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['lang_type'] = entity.langType;
  data['content'] = entity.content;
  data['url'] = entity.url;
  return data;
}

extension BackWaterDescEntityExtension on BackWaterDescEntity {
  BackWaterDescEntity copyWith({
    String? name,
    String? langType,
    String? content,
    String? url,
  }) {
    return BackWaterDescEntity()
      ..name = name ?? this.name
      ..langType = langType ?? this.langType
      ..content = content ?? this.content
      ..url = url ?? this.url;
  }
}