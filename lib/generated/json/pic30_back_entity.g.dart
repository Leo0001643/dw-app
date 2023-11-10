import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/pic30_back_entity.dart';

Pic30BackEntity $Pic30BackEntityFromJson(Map<String, dynamic> json) {
  final Pic30BackEntity pic30BackEntity = Pic30BackEntity();
  final Pic30BackBack? back = jsonConvert.convert<Pic30BackBack>(json['back']);
  if (back != null) {
    pic30BackEntity.back = back;
  }
  final Pic30BackBack? logo = jsonConvert.convert<Pic30BackBack>(json['logo']);
  if (logo != null) {
    pic30BackEntity.logo = logo;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    pic30BackEntity.url = url;
  }
  return pic30BackEntity;
}

Map<String, dynamic> $Pic30BackEntityToJson(Pic30BackEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['back'] = entity.back?.toJson();
  data['logo'] = entity.logo?.toJson();
  data['url'] = entity.url;
  return data;
}

extension Pic30BackEntityExtension on Pic30BackEntity {
  Pic30BackEntity copyWith({
    Pic30BackBack? back,
    Pic30BackBack? logo,
    String? url,
  }) {
    return Pic30BackEntity()
      ..back = back ?? this.back
      ..logo = logo ?? this.logo
      ..url = url ?? this.url;
  }
}

Pic30BackBack $Pic30BackBackFromJson(Map<String, dynamic> json) {
  final Pic30BackBack pic30BackBack = Pic30BackBack();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pic30BackBack.name = name;
  }
  final String? langType = jsonConvert.convert<String>(json['lang_type']);
  if (langType != null) {
    pic30BackBack.langType = langType;
  }
  final String? tag = jsonConvert.convert<String>(json['tag']);
  if (tag != null) {
    pic30BackBack.tag = tag;
  }
  final String? position = jsonConvert.convert<String>(json['position']);
  if (position != null) {
    pic30BackBack.position = position;
  }
  final String? picUrl = jsonConvert.convert<String>(json['pic_url']);
  if (picUrl != null) {
    pic30BackBack.picUrl = picUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    pic30BackBack.type = type;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    pic30BackBack.status = status;
  }
  return pic30BackBack;
}

Map<String, dynamic> $Pic30BackBackToJson(Pic30BackBack entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['lang_type'] = entity.langType;
  data['tag'] = entity.tag;
  data['position'] = entity.position;
  data['pic_url'] = entity.picUrl;
  data['type'] = entity.type;
  data['status'] = entity.status;
  return data;
}

extension Pic30BackBackExtension on Pic30BackBack {
  Pic30BackBack copyWith({
    String? name,
    String? langType,
    String? tag,
    String? position,
    String? picUrl,
    String? type,
    String? status,
  }) {
    return Pic30BackBack()
      ..name = name ?? this.name
      ..langType = langType ?? this.langType
      ..tag = tag ?? this.tag
      ..position = position ?? this.position
      ..picUrl = picUrl ?? this.picUrl
      ..type = type ?? this.type
      ..status = status ?? this.status;
  }
}