import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/promotion_type_entity.dart';

PromotionTypeEntity $PromotionTypeEntityFromJson(Map<String, dynamic> json) {
  final PromotionTypeEntity promotionTypeEntity = PromotionTypeEntity();
  final List<PromotionTypeKey>? chongzhi = (json['充值'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<PromotionTypeKey>(e) as PromotionTypeKey)
      .toList();
  if (chongzhi != null) {
    promotionTypeEntity.chongzhi = chongzhi;
  }
  final List<PromotionTypeKey>? qita = (json['其他'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<PromotionTypeKey>(e) as PromotionTypeKey)
      .toList();
  if (qita != null) {
    promotionTypeEntity.qita = qita;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    promotionTypeEntity.url = url;
  }
  return promotionTypeEntity;
}

Map<String, dynamic> $PromotionTypeEntityToJson(PromotionTypeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['充值'] = entity.chongzhi?.map((v) => v.toJson()).toList();
  data['其他'] = entity.qita?.map((v) => v.toJson()).toList();
  data['url'] = entity.url;
  return data;
}

extension PromotionTypeEntityExtension on PromotionTypeEntity {
  PromotionTypeEntity copyWith({
    List<PromotionTypeKey>? chongzhi,
    List<PromotionTypeKey>? qita,
    String? url,
  }) {
    return PromotionTypeEntity()
      ..chongzhi = chongzhi ?? this.chongzhi
      ..qita = qita ?? this.qita
      ..url = url ?? this.url;
  }
}

PromotionTypeKey $PromotionTypeKeyFromJson(Map<String, dynamic> json) {
  final PromotionTypeKey promotionTypeKey = PromotionTypeKey();
  final String? picurl = jsonConvert.convert<String>(json['picurl']);
  if (picurl != null) {
    promotionTypeKey.picurl = picurl;
  }
  final String? startTime = jsonConvert.convert<String>(json['start_time']);
  if (startTime != null) {
    promotionTypeKey.startTime = startTime;
  }
  final String? titleSec = jsonConvert.convert<String>(json['title_sec']);
  if (titleSec != null) {
    promotionTypeKey.titleSec = titleSec;
  }
  final int? endTime = jsonConvert.convert<int>(json['end_time']);
  if (endTime != null) {
    promotionTypeKey.endTime = endTime;
  }
  final String? langType = jsonConvert.convert<String>(json['lang_type']);
  if (langType != null) {
    promotionTypeKey.langType = langType;
  }
  final String? sortby = jsonConvert.convert<String>(json['sortby']);
  if (sortby != null) {
    promotionTypeKey.sortby = sortby;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    promotionTypeKey.id = id;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    promotionTypeKey.type = type;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    promotionTypeKey.title = title;
  }
  return promotionTypeKey;
}

Map<String, dynamic> $PromotionTypeKeyToJson(PromotionTypeKey entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['picurl'] = entity.picurl;
  data['start_time'] = entity.startTime;
  data['title_sec'] = entity.titleSec;
  data['end_time'] = entity.endTime;
  data['lang_type'] = entity.langType;
  data['sortby'] = entity.sortby;
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['title'] = entity.title;
  return data;
}

extension PromotionTypeKeyExtension on PromotionTypeKey {
  PromotionTypeKey copyWith({
    String? picurl,
    String? startTime,
    String? titleSec,
    int? endTime,
    String? langType,
    String? sortby,
    String? id,
    String? type,
    String? title,
  }) {
    return PromotionTypeKey()
      ..picurl = picurl ?? this.picurl
      ..startTime = startTime ?? this.startTime
      ..titleSec = titleSec ?? this.titleSec
      ..endTime = endTime ?? this.endTime
      ..langType = langType ?? this.langType
      ..sortby = sortby ?? this.sortby
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..title = title ?? this.title;
  }
}