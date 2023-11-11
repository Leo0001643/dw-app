import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/promotion_detail_entity.dart';

PromotionDetailEntity $PromotionDetailEntityFromJson(
    Map<String, dynamic> json) {
  final PromotionDetailEntity promotionDetailEntity = PromotionDetailEntity();
  final int? endTime = jsonConvert.convert<int>(json['end_time']);
  if (endTime != null) {
    promotionDetailEntity.endTime = endTime;
  }
  final int? usepic = jsonConvert.convert<int>(json['usepic']);
  if (usepic != null) {
    promotionDetailEntity.usepic = usepic;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    promotionDetailEntity.title = title;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    promotionDetailEntity.content = content;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    promotionDetailEntity.url = url;
  }
  final String? picurl = jsonConvert.convert<String>(json['picurl']);
  if (picurl != null) {
    promotionDetailEntity.picurl = picurl;
  }
  final int? startTime = jsonConvert.convert<int>(json['start_time']);
  if (startTime != null) {
    promotionDetailEntity.startTime = startTime;
  }
  final String? titleSec = jsonConvert.convert<String>(json['title_sec']);
  if (titleSec != null) {
    promotionDetailEntity.titleSec = titleSec;
  }
  final String? updateTime = jsonConvert.convert<String>(json['update_time']);
  if (updateTime != null) {
    promotionDetailEntity.updateTime = updateTime;
  }
  final String? langType = jsonConvert.convert<String>(json['lang_type']);
  if (langType != null) {
    promotionDetailEntity.langType = langType;
  }
  final String? linkOut = jsonConvert.convert<String>(json['link_out']);
  if (linkOut != null) {
    promotionDetailEntity.linkOut = linkOut;
  }
  final String? sortby = jsonConvert.convert<String>(json['sortby']);
  if (sortby != null) {
    promotionDetailEntity.sortby = sortby;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    promotionDetailEntity.status = status;
  }
  return promotionDetailEntity;
}

Map<String, dynamic> $PromotionDetailEntityToJson(
    PromotionDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['end_time'] = entity.endTime;
  data['usepic'] = entity.usepic;
  data['title'] = entity.title;
  data['content'] = entity.content;
  data['url'] = entity.url;
  data['picurl'] = entity.picurl;
  data['start_time'] = entity.startTime;
  data['title_sec'] = entity.titleSec;
  data['update_time'] = entity.updateTime;
  data['lang_type'] = entity.langType;
  data['link_out'] = entity.linkOut;
  data['sortby'] = entity.sortby;
  data['status'] = entity.status;
  return data;
}

extension PromotionDetailEntityExtension on PromotionDetailEntity {
  PromotionDetailEntity copyWith({
    int? endTime,
    int? usepic,
    String? title,
    String? content,
    String? url,
    String? picurl,
    int? startTime,
    String? titleSec,
    String? updateTime,
    String? langType,
    String? linkOut,
    String? sortby,
    String? status,
  }) {
    return PromotionDetailEntity()
      ..endTime = endTime ?? this.endTime
      ..usepic = usepic ?? this.usepic
      ..title = title ?? this.title
      ..content = content ?? this.content
      ..url = url ?? this.url
      ..picurl = picurl ?? this.picurl
      ..startTime = startTime ?? this.startTime
      ..titleSec = titleSec ?? this.titleSec
      ..updateTime = updateTime ?? this.updateTime
      ..langType = langType ?? this.langType
      ..linkOut = linkOut ?? this.linkOut
      ..sortby = sortby ?? this.sortby
      ..status = status ?? this.status;
  }
}