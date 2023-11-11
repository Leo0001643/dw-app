import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/news_rate_entity.dart';

NewsRateEntity $NewsRateEntityFromJson(Map<String, dynamic> json) {
  final NewsRateEntity newsRateEntity = NewsRateEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    newsRateEntity.name = name;
  }
  final String? langType = jsonConvert.convert<String>(json['lang_type']);
  if (langType != null) {
    newsRateEntity.langType = langType;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    newsRateEntity.content = content;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    newsRateEntity.url = url;
  }
  return newsRateEntity;
}

Map<String, dynamic> $NewsRateEntityToJson(NewsRateEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['lang_type'] = entity.langType;
  data['content'] = entity.content;
  data['url'] = entity.url;
  return data;
}

extension NewsRateEntityExtension on NewsRateEntity {
  NewsRateEntity copyWith({
    String? name,
    String? langType,
    String? content,
    String? url,
  }) {
    return NewsRateEntity()
      ..name = name ?? this.name
      ..langType = langType ?? this.langType
      ..content = content ?? this.content
      ..url = url ?? this.url;
  }
}