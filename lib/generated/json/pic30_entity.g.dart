import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/pic30_entity.dart';

Pic30Entity $Pic30EntityFromJson(Map<String, dynamic> json) {
  final Pic30Entity pic30Entity = Pic30Entity();
  final String? picurl = jsonConvert.convert<String>(json['picurl']);
  if (picurl != null) {
    pic30Entity.picurl = picurl;
  }
  final String? linkType = jsonConvert.convert<String>(json['link_type']);
  if (linkType != null) {
    pic30Entity.linkType = linkType;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    pic30Entity.link = link;
  }
  final String? langType = jsonConvert.convert<String>(json['lang_type']);
  if (langType != null) {
    pic30Entity.langType = langType;
  }
  final String? sortby = jsonConvert.convert<String>(json['sortby']);
  if (sortby != null) {
    pic30Entity.sortby = sortby;
  }
  final String? linkOut = jsonConvert.convert<String>(json['link_out']);
  if (linkOut != null) {
    pic30Entity.linkOut = linkOut;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    pic30Entity.title = title;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    pic30Entity.url = url;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    pic30Entity.status = status;
  }
  return pic30Entity;
}

Map<String, dynamic> $Pic30EntityToJson(Pic30Entity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['picurl'] = entity.picurl;
  data['link_type'] = entity.linkType;
  data['link'] = entity.link;
  data['lang_type'] = entity.langType;
  data['sortby'] = entity.sortby;
  data['link_out'] = entity.linkOut;
  data['title'] = entity.title;
  data['url'] = entity.url;
  data['status'] = entity.status;
  return data;
}

extension Pic30EntityExtension on Pic30Entity {
  Pic30Entity copyWith({
    String? picurl,
    String? linkType,
    String? link,
    String? langType,
    String? sortby,
    String? linkOut,
    String? title,
    String? url,
    String? status,
  }) {
    return Pic30Entity()
      ..picurl = picurl ?? this.picurl
      ..linkType = linkType ?? this.linkType
      ..link = link ?? this.link
      ..langType = langType ?? this.langType
      ..sortby = sortby ?? this.sortby
      ..linkOut = linkOut ?? this.linkOut
      ..title = title ?? this.title
      ..url = url ?? this.url
      ..status = status ?? this.status;
  }
}