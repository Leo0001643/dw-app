import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/language_menu_entity.dart';

LanguageMenuEntity $LanguageMenuEntityFromJson(Map<String, dynamic> json) {
  final LanguageMenuEntity languageMenuEntity = LanguageMenuEntity();
  final String? language = jsonConvert.convert<String>(json['language']);
  if (language != null) {
    languageMenuEntity.language = language;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    languageMenuEntity.icon = icon;
  }
  return languageMenuEntity;
}

Map<String, dynamic> $LanguageMenuEntityToJson(LanguageMenuEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['language'] = entity.language;
  data['icon'] = entity.icon;
  return data;
}

extension LanguageMenuEntityExtension on LanguageMenuEntity {
  LanguageMenuEntity copyWith({
    String? language,
    String? icon,
  }) {
    return LanguageMenuEntity()
      ..language = language ?? this.language
      ..icon = icon ?? this.icon;
  }
}