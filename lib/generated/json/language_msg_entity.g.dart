import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/language_msg_entity.dart';


LanguageMsgEntity $LanguageMsgEntityFromJson(Map<String, dynamic> json) {
  final LanguageMsgEntity languageMsgEntity = LanguageMsgEntity();
  final String? zh = jsonConvert.convert<String>(json['zh']);
  if (zh != null) {
    languageMsgEntity.zh = zh;
  }
  final String? en = jsonConvert.convert<String>(json['en']);
  if (en != null) {
    languageMsgEntity.en = en;
  }
  final String? vi = jsonConvert.convert<String>(json['vi']);
  if (vi != null) {
    languageMsgEntity.vi = vi;
  }
  return languageMsgEntity;
}

Map<String, dynamic> $LanguageMsgEntityToJson(LanguageMsgEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['zh'] = entity.zh;
  data['en'] = entity.en;
  data['vi'] = entity.vi;
  return data;
}

extension LanguageMsgEntityExtension on LanguageMsgEntity {
  LanguageMsgEntity copyWith({
    String? zh,
    String? en,
    String? vi,
  }) {
    return LanguageMsgEntity()
      ..zh = zh ?? this.zh
      ..en = en ?? this.en
      ..vi = vi ?? this.vi;
  }
}