import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/help_entity.dart';

HelpEntity $HelpEntityFromJson(Map<String, dynamic> json) {
  final HelpEntity helpEntity = HelpEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    helpEntity.name = name;
  }
  final String? confirmid = jsonConvert.convert<String>(json['confirmid']);
  if (confirmid != null) {
    helpEntity.confirmid = confirmid;
  }
  final String? tag = jsonConvert.convert<String>(json['tag']);
  if (tag != null) {
    helpEntity.tag = tag;
  }
  final String? langType = jsonConvert.convert<String>(json['lang_type']);
  if (langType != null) {
    helpEntity.langType = langType;
  }
  return helpEntity;
}

Map<String, dynamic> $HelpEntityToJson(HelpEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['confirmid'] = entity.confirmid;
  data['tag'] = entity.tag;
  data['lang_type'] = entity.langType;
  return data;
}

extension HelpEntityExtension on HelpEntity {
  HelpEntity copyWith({
    String? name,
    String? confirmid,
    String? tag,
    String? langType,
  }) {
    return HelpEntity()
      ..name = name ?? this.name
      ..confirmid = confirmid ?? this.confirmid
      ..tag = tag ?? this.tag
      ..langType = langType ?? this.langType;
  }
}